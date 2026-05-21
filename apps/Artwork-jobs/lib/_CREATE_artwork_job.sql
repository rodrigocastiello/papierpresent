WITH next_id AS (   
  SELECT nextval('artwork_jobs_id_seq') AS id
),
new_aj AS (
  INSERT INTO artwork_jobs (id, code, name, category, customer_id, created_at, updated_at)
  SELECT
    n.id,
    'AJ-' || LPAD(n.id::text, 5, '0'),
    {{ payload.name }},
    {{ payload.category }},
    {{ payload.customer_id }},
    NOW(),
    NOW() 
  FROM next_id n
  RETURNING id, code
),
link AS (
  UPDATE products
  SET artwork_job_id = (SELECT id FROM new_aj),
      updated_at     = NOW()
  WHERE id = {{ payload.product_id }}
  RETURNING id
)
SELECT a.id AS artwork_job_id, a.code AS artwork_job_code, (SELECT id FROM link) AS product_id
FROM new_aj a;
