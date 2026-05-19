WITH next_id AS (
  SELECT nextval('call_offs_id_seq') AS id
),

new_call_off AS (
  INSERT INTO call_offs (
    id,
    code,
    customer_id,
    requested_date,
    customer_deadline,
    delivery_mode,
    notes,
    created_by
  )
  SELECT
    n.id,
    'CO-' || LPAD(n.id::text, 5, '0'),
    {{ payload.customer_id }},
    {{ payload.requested_date }},
    {{ payload.customer_deadline }},
    {{ payload.delivery_mode }},
    {{ payload.notes }},
    COALESCE(
      (
        SELECT id
        FROM users
        WHERE email = {{ current_user.email }}
        LIMIT 1
      ),
      1
    )
  FROM next_id n
  RETURNING id
)

INSERT INTO call_off_lines (
  call_off_id,
  line_number,
  product_id,
  artwork_job_id,
  quantity_requested
)

SELECT
  (SELECT id FROM new_call_off),
  ord::int,
  (line->>'product_id')::int,
  (line->>'artwork_job_id')::int,
  (line->>'quantity_requested')::int

FROM jsonb_array_elements(
  {{ JSON.stringify(payload.lines) }}::jsonb
) WITH ORDINALITY AS t(line, ord)

RETURNING call_off_id;