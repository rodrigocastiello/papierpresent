WITH actor AS (     
  SELECT COALESCE(
    (SELECT id FROM users WHERE email = {{ current_user.email }} LIMIT 1),
    1
  ) AS id
), 
upd AS (
  UPDATE products
  SET artwork_job_id = {{ payload.artwork_job_id }}
  WHERE id = {{ payload.product_id }}
    AND artwork_job_id IS NULL
  RETURNING id, code, customer_id, artwork_job_id
)
SELECT u.id, u.code, u.customer_id, u.artwork_job_id, aj.code AS artwork_job_code
FROM upd u
JOIN artwork_jobs aj ON aj.id = u.artwork_job_id;