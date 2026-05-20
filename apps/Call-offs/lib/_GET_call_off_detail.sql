WITH base AS (
  SELECT
    co.id,
    co.code,
    co.customer_id,
    co.state,
    co.requested_date,
    co.customer_deadline,
    co.delivery_mode,
    co.notes,
    co.created_at,
    co.updated_at,
    c.name                   AS customer_name,
    c.sales_contact_email    AS customer_contact,
    u.email                  AS created_by_email,
    (
      SELECT count(*)::int
      FROM call_off_lines col
      WHERE col.call_off_id = co.id
    )                        AS line_count,
    (
      SELECT COALESCE(SUM(col.quantity_requested), 0)::int
      FROM call_off_lines col
      WHERE col.call_off_id = co.id
    )                        AS units_requested
  FROM call_offs co
  JOIN customers c ON c.id = co.customer_id
  LEFT JOIN users u ON u.id = co.created_by
  WHERE co.id = {{ call_off_id }}
)
SELECT
  b.*,
  -- Sidebar customer-card counters (mockup numbers come from these)
  (
    SELECT count(*)::int
    FROM call_offs other
    WHERE other.customer_id = b.customer_id
      AND other.state IN ('open', 'picking')
      AND other.id <> b.id
  )                                                AS active_call_offs,
  (
    SELECT count(DISTINCT p.artwork_job_id)::int
    FROM products p
    WHERE p.customer_id = b.customer_id
      AND p.artwork_job_id IS NOT NULL
  )                                                AS active_artwork_jobs,
  (
    SELECT COALESCE(SUM(ii.on_hand), 0)::int
    FROM inventory_items ii
    WHERE ii.customer_id = b.customer_id
  )                                                AS on_hand_units
FROM base b;