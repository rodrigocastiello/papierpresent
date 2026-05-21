WITH
actor AS (
  SELECT COALESCE(
    (SELECT id FROM users WHERE email = {{ current_user.email }} LIMIT 1),
    1
  ) AS id
),
target_item AS (
  SELECT ii.id, ii.on_hand
  FROM inventory_items ii
  WHERE ii.product_id     = {{ payload.product_id }}
    AND ii.artwork_job_id = {{ payload.artwork_job_id }}
    AND ii.customer_id    = {{ payload.customer_id }}
  FOR UPDATE
),
target_placement AS (
  SELECT ip.inventory_item_id, ip.location_id, ip.quantity
  FROM inventory_placements ip
  WHERE ip.inventory_item_id = (SELECT id FROM target_item)
    AND ip.location_id       = {{ payload.location_id }}
  FOR UPDATE
),
movement AS (
  INSERT INTO inventory_movements (
    event_type, delta, product_id, artwork_job_id, customer_id, location_id,
    actor_id, reason_code, reason_detail, on_hand_before, on_hand_after
  )
  SELECT
    'adjustment',
    {{ payload.delta }}::int,
    {{ payload.product_id }},
    {{ payload.artwork_job_id }},
    {{ payload.customer_id }},
    {{ payload.location_id }},
    (SELECT id FROM actor),
    {{ payload.reason_code }},
    {{ payload.reason_detail }},
    ti.on_hand,
    ti.on_hand + {{ payload.delta }}::int
  FROM target_item ti
  RETURNING id, on_hand_before, on_hand_after, created_at
),
ii_update AS (
  UPDATE inventory_items ii
  SET on_hand = ii.on_hand + {{ payload.delta }}::int
  FROM target_item ti
  WHERE ii.id = ti.id
  RETURNING ii.id, ii.on_hand
),
ip_update AS (
  UPDATE inventory_placements ip
  SET quantity = ip.quantity + {{ payload.delta }}::int
  FROM target_placement tp
  WHERE ip.inventory_item_id = tp.inventory_item_id
    AND ip.location_id       = tp.location_id
  RETURNING ip.location_id, ip.quantity
)
SELECT
  m.id,
  m.on_hand_before,
  m.on_hand_after,
  m.created_at
FROM movement m;
