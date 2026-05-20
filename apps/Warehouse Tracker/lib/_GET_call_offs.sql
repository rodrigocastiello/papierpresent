SELECT
  co.*,
  c.name AS customer_name,
  u.name AS user_name,
  (SELECT COUNT(*) FROM call_off_lines col WHERE col.call_off_id = co.id) AS line_count
FROM
  call_offs co
  LEFT JOIN customers c ON c.id = co.customer_id
  LEFT JOIN users u ON u.id = co.created_by
WHERE
  co.state IN ('open', 'picking');