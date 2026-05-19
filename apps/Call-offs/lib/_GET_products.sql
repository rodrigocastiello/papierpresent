SELECT
  p.id           AS product_id,
  p.code         AS product_code,
  p.display_name AS product_name,
  p.size         AS product_size,
  p.category,
  p.units_per_carton,
  p.customer_id,
  c.name         AS customer_name,
  aj.id           AS artwork_job_id,
  aj.code         AS artwork_job_code,
  aj.name         AS artwork_job_name,
  ii.on_hand,
  ii.reserved,
  ii.available,
  COALESCE(
    (
      SELECT json_agg(wl.code ORDER BY wl.code)
      FROM inventory_placements ip
      JOIN warehouse_locations wl
        ON wl.id = ip.location_id
      WHERE ip.inventory_item_id = ii.id
    ),
    '[]'::json
  ) AS racks
FROM products p
JOIN customers c
  ON c.id = p.customer_id
LEFT JOIN artwork_jobs aj
  ON aj.id = p.artwork_job_id
LEFT JOIN inventory_items ii
  ON ii.product_id = p.id
WHERE p.artwork_job_id IS NOT NULL -- skip unlinked Odoo products
ORDER BY
  p.category,
  aj.code,
  p.size;