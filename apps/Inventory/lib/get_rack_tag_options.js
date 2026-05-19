const rows = {{get_inventory.value || []}};

const set = new Set();
for (const r of rows) {
  (r.racks_tags || []).forEach(t => set.add(t));
  (r.products || []).forEach(p => (p.racks_tags || []).forEach(t => set.add(t)));
}

return [...set].sort().map(t => {
  const isPartial = t.endsWith(" *");
  return {
    value: t,
    label: t.replace(" *", ""),
    color: isPartial ? "#fef3c7" : "#e5e7eb",
  };
});