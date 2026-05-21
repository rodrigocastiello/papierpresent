const rows = formatDataAsArray({{_GET_unlinked_products.data}}) || [];

const seen = new Map();
rows.forEach(r => {
  if (r.customer_id && !seen.has(r.customer_id)) {
    seen.set(r.customer_id, r.customer_name);
  }
});

return [...seen.entries()]
  .sort((a, b) => String(a[1]).localeCompare(String(b[1])))
  .map(([id, name]) => ({ value: id, label: name }));