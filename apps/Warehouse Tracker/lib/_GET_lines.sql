SELECT
  col.id,
  col.call_off_id,
  col.line_number,
  col.line_state,
  col.product_id,
  p.code           AS product_code,
  p.display_name   AS product_name,
  p.category       AS product_category,
  p.size           AS product_size,
  p.units_per_carton,
  aj.code          AS artwork_job_code,
  c.name           AS customer_name,
  col.quantity_requested,
  col.quantity_picked,
  col.location_id,
  wl.code          AS rack_code,
  ii.available     AS rack_units,
  col.location_confirmed_at,
  col.picked_at,
  col.picked_by,
  col.note
FROM call_off_lines col
JOIN call_offs co            ON co.id = col.call_off_id
JOIN customers c             ON c.id  = co.customer_id
JOIN products p              ON p.id  = col.product_id
LEFT JOIN artwork_jobs aj    ON aj.id = col.artwork_job_id
LEFT JOIN warehouse_locations wl ON wl.id = col.location_id
LEFT JOIN inventory_items ii ON ii.product_id = col.product_id
                            AND ii.artwork_job_id = col.artwork_job_id
                            AND ii.customer_id = co.customer_id
ORDER BY col.call_off_id, col.line_number;