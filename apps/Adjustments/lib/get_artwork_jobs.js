const rows = formatDataAsArray({{_GET_artwork_jobs.data}}) || [];
return rows.map(r => ({
  value: r.artwork_job_id,
  label: `${r.artwork_job_code}  ${r.artwork_job_name || ""}`.trim(),
  caption: `${r.p_number_count} P-number${r.p_number_count === 1 ? "" : "s"} · ${r.rack_count} rack${r.rack_count ===
1 ? "" : "s"} · ${Number(r.on_hand_total).toLocaleString()} units on-hand`,
  code: r.artwork_job_code,
  category: r.category,
}));