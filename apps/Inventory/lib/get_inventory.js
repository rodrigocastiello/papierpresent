const raw = formatDataAsArray({{ _GET_inventory.data }}) || [];

const categoryFilter = {{ inventoryCategoryTabs?.value }};
const searchRaw      = {{ inventorySearch?.value }};
const search         = (searchRaw || "").toString().toLowerCase().trim();

const formatRacks = (racks) => {
  const list = Array.isArray(racks) ? racks : [];
  if (list.length === 0) return "—";
  const head = list.slice(0, 3).map(r => {
    const tag = r.is_full ? "" : " *";
    return `${r.rack}${tag}`;
  }).join(" · ");
  const overflow = list.length > 3 ? `  +${list.length - 3}` : "";
  return head + overflow;
};

const rows = [];
for (const aj of raw) {
  const products = Array.isArray(aj.products) ? aj.products : [];
  products.forEach((p, idx) => {
    rows.push({
      id: `${aj.artwork_job_id}-${p.product_id}`,
      artwork_job_id:   aj.artwork_job_id,
      artwork_job_code: aj.artwork_job_code,
      artwork_job_name: aj.artwork_job_name,
      category:         aj.category,
      sizes_count:       products.length,
      is_first_in_group: idx === 0,
      product_id:       p.product_id,
      p_number:         p.p_number,
      size:             p.size, 
      units_per_carton: p.units_per_carton,
      units_per_pallet: p.units_per_pallet,
      on_hand:   p.on_hand,
      reserved:  p.reserved,
      available: p.available,
      racks:         p.racks,
      racks_display: formatRacks(p.racks),
    });
  });
}

let filtered = rows;
if (categoryFilter && categoryFilter !== "all") {
  filtered = filtered.filter(r => r.category === categoryFilter);
}
if (search) { 
  filtered = filtered.filter(r =>
    (r.p_number || "").toLowerCase().includes(search) ||
    (r.artwork_job_code || "").toLowerCase().includes(search) ||
    (r.artwork_job_name || "").toLowerCase().includes(search) ||
    (r.size || "").toLowerCase().includes(search)
  );
} 

return filtered;