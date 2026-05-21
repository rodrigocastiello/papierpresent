SELECT
  p.id              AS product_id,
  p.code            AS p_number,
  p.display_name    AS product_name,
  p.size            AS product_size,
  p.units_per_carton,
  p.units_per_pallet,
  p.artwork_job_id,
  p.customer_id,
  ii.id             AS inventory_item_id,
  COALESCE(ii.on_hand, 0)::int    AS on_hand,
  COALESCE(ii.reserved, 0)::int   AS reserved,
  COALESCE(ii.available, ii.on_hand - ii.reserved, 0)::int AS available
FROM products p
LEFT JOIN inventory_items ii
  ON ii.product_id     = p.id
 AND ii.artwork_job_id = p.artwork_job_id
 AND ii.customer_id    = p.customer_id
WHERE p.artwork_job_id = {{ select2.value }}
ORDER BY p.size NULLS FIRST, p.code;