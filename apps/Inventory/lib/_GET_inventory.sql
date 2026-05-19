WITH placements AS (
  SELECT
    ip.inventory_item_id,
    json_agg(
      json_build_object(
        'location_id',      wl.id,
        'rack',             wl.code,
        'zone',             wl.zone,
        'quantity',         ip.quantity,
        'cartons',          CASE WHEN p.units_per_carton > 0
                                 THEN ip.quantity / p.units_per_carton
                                 ELSE NULL END,
        'units_per_pallet', p.units_per_pallet,
        'is_full',          (ip.quantity = p.units_per_pallet)
      )
      ORDER BY wl.code
    ) AS racks
  FROM inventory_placements ip
  JOIN warehouse_locations wl ON wl.id = ip.location_id
  JOIN inventory_items     ii ON ii.id = ip.inventory_item_id
  JOIN products            p  ON p.id  = ii.product_id
  GROUP BY ip.inventory_item_id
),

product_rows AS (
  SELECT
    ii.customer_id,
    ii.artwork_job_id,
    p.id                                             AS product_id,
    p.code                                           AS p_number,
    p.size,
    p.units_per_carton,
    p.units_per_pallet,
    ii.on_hand,
    ii.reserved,
    COALESCE(ii.available, ii.on_hand - ii.reserved) AS available,
    COALESCE(pl.racks, '[]'::json)                   AS racks
  FROM inventory_items ii
  JOIN products      p  ON p.id = ii.product_id
  LEFT JOIN placements pl ON pl.inventory_item_id = ii.id
)

SELECT
  aj.customer_id             AS customer_id,
  aj.id                      AS artwork_job_id,
  aj.code                    AS artwork_job_code,
  aj.name                    AS artwork_job_name,
  aj.category                AS category,
  count(pr.product_id)::int  AS product_count,
  SUM(pr.on_hand)::int       AS on_hand,
  SUM(pr.reserved)::int      AS reserved,
  SUM(pr.available)::int     AS available,
  json_agg(
    json_build_object(
      'product_id',       pr.product_id,
      'p_number',         pr.p_number,
      'size',             pr.size,
      'units_per_carton', pr.units_per_carton,
      'units_per_pallet', pr.units_per_pallet,
      'on_hand',          pr.on_hand,
      'reserved',         pr.reserved,
      'available',        pr.available,
      'racks',            pr.racks
    )
    ORDER BY pr.size NULLS FIRST, pr.p_number
  ) AS products
FROM artwork_jobs aj
JOIN product_rows pr ON pr.artwork_job_id = aj.id
GROUP BY aj.customer_id, aj.id, aj.code, aj.name, aj.category
ORDER BY aj.code;