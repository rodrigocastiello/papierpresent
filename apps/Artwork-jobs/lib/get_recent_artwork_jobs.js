const rows = formatDataAsArray({{_GET_recent_artwork_jobs.data}}) || [];

const palette = ["#16a34a","#0ea5e9","#9333ea","#dc2626","#f59e0b","#0f766e","#db2777"];
const colorFor = (name) => {
  const s = String(name || "");
  let h = 0;
  for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) >>> 0;
  return palette[h % palette.length];
};

return rows.map(r => ({
  artwork_job_id: r.artwork_job_id,
  artwork_job_code: r.artwork_job_code,
  artwork_job_name: r.artwork_job_name,
  category: r.category,
  customer_id: r.customer_id,
  customer_name: r.customer_name,
  customer_color: colorFor(r.customer_name),
  customer_initials: String(r.customer_name || "").split(/\s+/).map(w => w[0]).join("").slice(0, 2).toUpperCase(),
  size_label: (r.sizes || []).slice(0, 3).join(" · "),
  on_hand_total: r.on_hand_total
}));