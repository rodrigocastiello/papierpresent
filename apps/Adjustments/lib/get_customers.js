const rows = formatDataAsArray({{_GET_customers.data}}) || [];

// Stable color from the name — no DB column needed.
const palette = ["#16a34a", "#0ea5e9", "#9333ea", "#dc2626", "#f59e0b", "#0f766e", "#db2777"];
const colorFor = (name) => {
  const s = String(name || "");
  let h = 0;
  for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) >>> 0;
  return palette[h % palette.length];
};

return rows.map(r => ({
  value: r.customer_id,
  label: r.customer_name,
  caption: `${r.artwork_job_count} artwork-jobs · ${Number(r.on_hand_total).toLocaleString()} units on-hand`,
  color: colorFor(r.customer_name),
}));