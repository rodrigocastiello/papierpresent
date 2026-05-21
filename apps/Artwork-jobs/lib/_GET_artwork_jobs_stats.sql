SELECT    
  (SELECT COUNT(*) FROM products      WHERE artwork_job_id IS NULL)::int AS unlinked_count,
  (SELECT COUNT(*) FROM artwork_jobs)::int                               AS active_count;
