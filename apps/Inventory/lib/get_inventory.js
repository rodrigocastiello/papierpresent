const raw = formatDataAsArray({{ _GET_inventory.data }}) || [];

const customerId     = {{ inventoryCustomerSelect?.value }};
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

let rows = raw.map(aj => {
  const products = Array.isArray(aj.products) ? aj.products : [];
  const single   = products.length === 1 ? products[0] : null;
  const multi    = products.length > 1;

  return {
    id:               aj.artwork_job_id,
    customer_id:      aj.customer_id,
    artwork_job_id:   aj.artwork_job_id,
    artwork_job_code: aj.artwork_job_code,
    artwork_job_name: aj.artwork_job_name,
    category:         aj.category,
    product_count:    products.length,

    on_hand:   aj.on_hand,
    reserved:  aj.reserved,
    available: aj.available,

    size_display:     multi ? `${products.length} sizes`     : (single?.size     || "—"),
    p_number_display: multi ? `${products.length} P-numbers` : (single?.p_number || "—"),
    racks_display:    multi ? "" : formatRacks(single?.racks || []),

    products: products.map(p => ({
      product_id:    p.product_id,
      size:          p.size,
      p_number:      p.p_number,
      on_hand:       p.on_hand,
      reserved:      p.reserved,
      available:     p.available,
      racks:         p.racks,
      racks_display: formatRacks(p.racks),
    })),
  };
});

if (customerId) {
  rows = rows.filter(r => r.customer_id === customerId);
}
if (categoryFilter && categoryFilter !== "all") {
  rows = rows.filter(r => r.category === categoryFilter);
}
if (search) {
  rows = rows.filter(r =>
    (r.artwork_job_code || "").toLowerCase().includes(search) ||
    (r.artwork_job_name || "").toLowerCase().includes(search) ||
    (r.products || []).some(p =>
      (p.p_number || "").toLowerCase().includes(search) ||
      (p.size     || "").toLowerCase().includes(search)
    )
  );
}

return rows;
