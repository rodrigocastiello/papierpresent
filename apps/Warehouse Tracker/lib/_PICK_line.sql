WITH
target_line AS (
  SELECT
    col.id,
    col.call_off_id,
    col.product_id,
    col.artwork_job_id,
    col.location_id,
    col.quantity_picked AS prev_picked,
    col.quantity_requested,
    co.customer_id
  FROM call_off_lines col
  JOIN call_offs co ON co.id = col.call_off_id
  WHERE col.id = {{ line_id }}
  FOR UPDATE OF col
),
actor AS (
  SELECT id FROM users WHERE email = {{ current_user.email }} LIMIT 1
),
delta_calc AS (
  SELECT
    tl.*,
    ({{ new_quantity_picked }}::int - tl.prev_picked) AS delta
  FROM target_line tl
),
movement AS (
  INSERT INTO inventory_movements (
    event_type, delta, product_id, artwork_job_id, customer_id, location_id,
    ref_call_off_id, ref_call_off_line_id, actor_id, reason_code,
    on_hand_before, on_hand_after
  )
  SELECT
    'pick',
    -d.delta,
    d.product_id,
    d.artwork_job_id,
    d.customer_id,
    d.location_id,
    d.call_off_id,
    d.id,
    (SELECT id FROM actor),
    'call_off_pick',
    ii.on_hand,
    ii.on_hand - d.delta
  FROM delta_calc d
  JOIN inventory_items ii
    ON ii.product_id = d.product_id
   AND ii.artwork_job_id = d.artwork_job_id
   AND ii.customer_id = d.customer_id
  WHERE d.delta <> 0
  RETURNING id
),
ii_update AS (
  UPDATE inventory_items ii
  SET on_hand = ii.on_hand - d.delta
  FROM delta_calc d
  WHERE ii.product_id = d.product_id
    AND ii.artwork_job_id = d.artwork_job_id
    AND ii.customer_id = d.customer_id
    AND d.delta <> 0
  RETURNING ii.id
),
line_update AS (
  UPDATE call_off_lines col
  SET
    quantity_picked = {{ new_quantity_picked }}::int,
    line_state = CASE
      WHEN {{ new_quantity_picked }}::int >= col.quantity_requested THEN 'complete'
      WHEN {{ new_quantity_picked }}::int > 0                       THEN 'in_progress'
      ELSE 'pending'
    END,
    picked_at = CASE
      WHEN {{ new_quantity_picked }}::int >= col.quantity_requested THEN NOW()
      ELSE NULL
    END,
    picked_by = CASE
      WHEN {{ new_quantity_picked }}::int >= col.quantity_requested
        THEN (SELECT id FROM actor)
      ELSE NULL
    END
  WHERE col.id = {{ line_id }}
  RETURNING col.id, col.call_off_id, col.line_state, col.quantity_picked, col.quantity_requested
),
co_update AS (
  UPDATE call_offs co
  SET state = 'picking',
      picking_started_at = COALESCE(co.picking_started_at, NOW()),
      picking_started_by = COALESCE(co.picking_started_by, (SELECT id FROM actor))
  FROM line_update lu
  WHERE co.id = lu.call_off_id
    AND co.state = 'open'
    AND lu.quantity_picked > 0
  RETURNING co.id
),
activity_log AS (
  INSERT INTO call_off_activity (call_off_id, actor_id, event_type, description, metadata)
  SELECT
    lu.call_off_id,
    (SELECT id FROM actor),
    CASE WHEN lu.line_state = 'complete' THEN 'line_completed' ELSE 'line_picked' END,
    'Line ' || lu.id || ' → ' || lu.quantity_picked || '/' || lu.quantity_requested,
    jsonb_build_object(
      'line_id', lu.id,
      'quantity_picked', lu.quantity_picked,
      'quantity_requested', lu.quantity_requested,
      'delta', (SELECT delta FROM delta_calc)
    )
  FROM line_update lu
  WHERE (SELECT delta FROM delta_calc) <> 0
  RETURNING id
)
SELECT * FROM line_update;