
SELECT    
  aj.id                AS artwork_job_id,
  aj.code              AS artwork_job_code,
  aj.name              AS artwork_job_name,
  aj.category          AS category,

  c.id                 AS customer_id,
  c.name               AS customer_name,

  COUNT(DISTINCT p.id)::int          AS p_number_count,
  COALESCE(SUM(ii.on_hand), 0)::int  AS on_hand_total,
  COALESCE(
    json_agg(DISTINCT p.size) FILTER (WHERE p.size IS NOT NULL),
    '[]'::json
  )                                  AS sizes,
  COALESCE(
    json_agg(DISTINCT p.code) FILTER (WHERE p.code IS NOT NULL),
    '[]'::json
  )                                  AS p_numbers

FROM artwork_jobs aj
LEFT JOIN customers       c  ON c.id = aj.customer_id
LEFT JOIN products        p  ON p.artwork_job_id = aj.id
LEFT JOIN inventory_items ii ON ii.artwork_job_id = aj.id

WHERE aj.customer_id = {{ _selected_product.value.customer_id }}

GROUP BY aj.id, aj.code, aj.name, aj.category, c.id, c.name
ORDER BY aj.code;
