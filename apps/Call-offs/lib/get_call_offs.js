  const rows = formatDataAsArray({{ _GET_call_offs.data }}) || [];

  const shaped = rows.map(r => ({
    id: r.id,
    call_off_id: r.code,
    customer: r.customer_name,
    requested: r.requested_date,
    state: r.state ? r.state.charAt(0).toUpperCase() + r.state.slice(1) : "",
    lines: `${r.line_count} line${r.line_count === 1 ? "" : "s"}`,
    created_by: r.created_by_email,
    updated: r.updated_at,
  }));

  // "Last N days" filter from select2
  const days = Number({{ select2?.value }});
  if (!Number.isFinite(days) || days <= 0) return shaped;

  const cutoff = moment().subtract(days, "days").startOf("day");
  return shaped.filter(r => moment(r.requested).isSameOrAfter(cutoff));