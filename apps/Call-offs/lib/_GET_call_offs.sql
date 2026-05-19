SELECT
  co.id,
  co.code,
  co.customer_id,
  c.name AS customer_name,
  co.state,
  co.requested_date,
  co.customer_deadline,
  co.delivery_mode,
  co.notes,
  co.created_at,
  co.updated_at,
  u.email AS created_by_email,
  (
    SELECT count(*)::int
    FROM call_off_lines col
    WHERE col.call_off_id = co.id
  ) AS line_count
FROM call_offs co   
JOIN customers c ON c.id = co.customer_id
LEFT JOIN users u ON u.id = co.created_by
ORDER BY co.created_at DESC;