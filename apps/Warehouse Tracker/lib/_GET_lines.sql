  SELECT
    col.id,
    col.call_off_id,
    col.line_number,
    col.line_state,
    col.product_id,
    p.code           AS product_code,
    p.display_name   AS product_name,
    p.units_per_carton,
    col.quantity_requested,
    col.quantity_picked,
    col.location_id,
    wl.code          AS rack_code,
    col.location_confirmed_at,
    col.picked_at,
    col.picked_by,
    col.note
  FROM call_off_lines col
  JOIN products p ON p.id = col.product_id
  LEFT JOIN warehouse_locations wl ON wl.id = col.location_id
  WHERE col.call_off_id = {{ _call_off_id.value }}
  ORDER BY col.line_number;
