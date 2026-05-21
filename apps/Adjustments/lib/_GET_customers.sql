SELECT
  c.id               AS customer_id,
  c.name             AS customer_name,
  COUNT(DISTINCT aj.id)::int    AS artwork_job_count,
  COALESCE(SUM(ii.on_hand), 0)::int AS on_hand_total
FROM customers c
LEFT JOIN artwork_jobs    aj ON aj.customer_id = c.id
LEFT JOIN inventory_items ii ON ii.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY c.name;