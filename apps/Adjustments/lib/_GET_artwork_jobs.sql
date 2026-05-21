SELECT
  aj.id                              AS artwork_job_id,
  aj.code                            AS artwork_job_code,
  aj.name                            AS artwork_job_name,
  aj.category                        AS category,
  aj.customer_id                     AS customer_id,
  COUNT(DISTINCT p.id)::int          AS p_number_count,
  COUNT(DISTINCT wl.id)::int         AS rack_count,
  COALESCE(SUM(ii.on_hand), 0)::int  AS on_hand_total
FROM artwork_jobs aj
LEFT JOIN products             p  ON p.artwork_job_id = aj.id
LEFT JOIN inventory_items      ii ON ii.artwork_job_id = aj.id
LEFT JOIN inventory_placements ip ON ip.inventory_item_id = ii.id
LEFT JOIN warehouse_locations  wl ON wl.id = ip.location_id
WHERE aj.customer_id = {{ select1.value }}
GROUP BY aj.id, aj.code, aj.name, aj.category, aj.customer_id
ORDER BY aj.code;