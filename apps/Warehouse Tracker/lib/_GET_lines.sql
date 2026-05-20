SELECT
  l.*,
  a.name,
  a.code,
  a.category
FROM
  call_off_lines l
  LEFT JOIN artwork_jobs a ON a.id = l.artwork_job_id