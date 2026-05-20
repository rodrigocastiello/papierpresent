SELECT
  col.id,
  col.line_number,
  col.product_id,
  col.artwork_job_id,
  col.quantity_requested,

  p.code            AS product_code,
  p.display_name    AS product_name,
  p.size            AS product_size,
  p.units_per_carton,
  p.category,

  aj.code           AS artwork_job_code,

  COALESCE(
    (
      SELECT json_agg(wl.code ORDER BY wl.code)
      FROM inventory_placements ip
      JOIN warehouse_locations wl ON wl.id = ip.location_id
      JOIN inventory_items ii     ON ii.id = ip.inventory_item_id
      WHERE ii.product_id      = p.id
        AND ii.artwork_job_id  = col.artwork_job_id
        AND ii.customer_id     = (
          SELECT customer_id FROM call_offs WHERE id = col.call_off_id
        )
    ),
    '[]'::json
  )                 AS racks

FROM call_off_lines col
LEFT JOIN products      p  ON p.id  = col.product_id
LEFT JOIN artwork_jobs  aj ON aj.id = col.artwork_job_id
WHERE col.call_off_id = {{ call_off_id }}
ORDER BY col.line_number;
