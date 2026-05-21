WITH next_n AS (
  SELECT (GREATEST(
    COALESCE((SELECT MAX(id) FROM artwork_jobs), 0),
    COALESCE((SELECT MAX(NULLIF(substring(code FROM 'AJ-(\d+)'), '')::int) FROM artwork_jobs), 0)
  ) + 1) AS n
),
seq_sync AS (
  SELECT setval('artwork_jobs_id_seq', (SELECT n FROM next_n))
),
new_aj AS (
  INSERT INTO artwork_jobs (id, code, name, category, customer_id)
  SELECT
    nx.n,
    'AJ-' || LPAD(nx.n::text, 5, '0'),
    {{ payload.name }},
    {{ payload.category }},
    {{ payload.customer_id }}
  FROM next_n nx
  RETURNING id, code
),
link AS (
  UPDATE products
  SET artwork_job_id = (SELECT id FROM new_aj)
  WHERE id = {{ payload.product_id }}
  RETURNING id
)
SELECT a.id AS artwork_job_id, a.code AS artwork_job_code, (SELECT id FROM link) AS product_id
FROM new_aj a;