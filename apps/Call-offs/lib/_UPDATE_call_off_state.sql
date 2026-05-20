UPDATE
  call_offs
SET
  state = {{ new_state }},
  updated_at = NOW ()
WHERE
  id = {{ call_off_id }} RETURNING id,
  code,
  state,
  updated_at;