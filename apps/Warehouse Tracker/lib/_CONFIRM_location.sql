UPDATE call_off_lines
SET location_confirmed_at = NOW()
WHERE id = {{ line_id }}
RETURNING id, location_confirmed_at;