const rows = formatDataAsArray({{_GET_unlinked_products.data}}) || [];

const palette = ["#16a34a","#0ea5e9","#9333ea","#dc2626","#f59e0b","#0f766e","#db2777"];
const colorFor = (name) => {
  const s = String(name || "");
  let h = 0;
  for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) >>> 0;
  return palette[h % palette.length];
};

const customerFilter = {{select3.value}};        // null = All
const syncedFilter   = {{select4.value}} || "";  // "" = All time

const windowMs = {
  "24h": 24 * 60 * 60 * 1000,
  "7d":  7  * 24 * 60 * 60 * 1000,
  "30d": 30 * 24 * 60 * 60 * 1000,
};
const now = Date.now();

const enriched = rows.map(r => ({
  id: r.product_id,
  p_number: r.p_number,
  odoo_product_name: r.odoo_product_name || r.product_display_name || "",
  product_display_name: r.product_display_name,
  size: r.product_size,
  category: r.category,
  customer_name: r.customer_name,
  customer_id: r.customer_id,
  customer_color: colorFor(r.customer_name),
  customer_initials: String(r.customer_name || "").split(/\s+/).map(w => w[0]).join("").slice(0, 2).toUpperCase(),
  synced_at: r.synced_at,
  synced_label: r.synced_at ? moment(r.synced_at).fromNow() : "—",
}));

return enriched.filter(row => {
  if (customerFilter && row.customer_id !== customerFilter) return false;

  if (syncedFilter && windowMs[syncedFilter]) {
    if (!row.synced_at) return false;
    const age = now - new Date(row.synced_at).getTime();
    if (age > windowMs[syncedFilter]) return false;
  }

  return true;
});
