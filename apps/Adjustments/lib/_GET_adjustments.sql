
SELECT
  m.id                           AS adjustment_id,
  m.created_at,
  m.delta,
  m.on_hand_before,
  m.on_hand_after,  
  m.reason_code,
  m.reason_detail,

  c.id                           AS customer_id,
  c.name                         AS customer_name,

  aj.id                          AS artwork_job_id,
  aj.code                        AS artwork_job_code,
  aj.name                        AS artwork_job_name,

  p.id                           AS product_id,
  p.code                         AS p_number,
  p.size                         AS product_size,

  wl.id                          AS location_id,
  wl.code                        AS rack_code,
  wl.zone                        AS zone,

  u.id                           AS actor_id,
  u.email                        AS actor_email,
  u.name                         AS actor_name

FROM inventory_movements m
LEFT JOIN customers          c  ON c.id  = m.customer_id
LEFT JOIN artwork_jobs       aj ON aj.id = m.artwork_job_id
LEFT JOIN products           p  ON p.id  = m.product_id
LEFT JOIN warehouse_locations wl ON wl.id = m.location_id
LEFT JOIN users              u  ON u.id  = m.actor_id

WHERE m.event_type = 'adjustment'

ORDER BY m.created_at DESC