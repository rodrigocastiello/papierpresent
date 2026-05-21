SELECT
  p.id              AS product_id,
  p.code            AS p_number, 
  p.name            AS odoo_product_name,
  p.display_name    AS product_display_name,
  p.size            AS product_size,
  p.category        AS category,
  p.units_per_carton,
  p.units_per_pallet,
  p.odoo_synced_at  AS synced_at,

  c.id              AS customer_id,
  c.name            AS customer_name

FROM products p
LEFT JOIN customers c ON c.id = p.customer_id

WHERE p.artwork_job_id IS NULL

ORDER BY p.odoo_synced_at DESC NULLS LAST, p.id DESC;