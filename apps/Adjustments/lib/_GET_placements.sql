SELECT
  wl.id                AS location_id,
  wl.code              AS rack_code,
  wl.zone              AS zone,
  ip.quantity::int     AS quantity,
  p.units_per_pallet,
  (ip.quantity = p.units_per_pallet) AS is_full_pallet
FROM inventory_placements ip
JOIN warehouse_locations  wl ON wl.id = ip.location_id
JOIN inventory_items      ii ON ii.id = ip.inventory_item_id
JOIN products             p  ON p.id  = ii.product_id
WHERE ii.product_id     = {{ select3.value }}
  AND ii.artwork_job_id = {{ select2.value }}
  AND ii.customer_id    = {{ select1.value }}
ORDER BY ip.quantity DESC, wl.code;