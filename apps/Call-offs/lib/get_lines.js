const items = {{_lines.value || []}};

const products = {{formatDataAsArray(_GET_products.data) || []}};

// products use product_id as the key, not id
const stockById = new Map(products.map(p => [p.product_id, p.available ?? null]));

return items.map(row => {
  const stock = row.product_id == null ? null : stockById.get(row.product_id) ?? null;

  const hasProduct = row.product_id != null;
  const hasArtwork = row.artwork_job_id != null && row.artwork_job_id !== "";
  const qty = Number(row.quantity_requested);
  const qtyOk = Number.isFinite(qty) && qty > 0 && (stock == null || qty <= stock);

  return { ...row, is_valid: hasProduct && hasArtwork && qtyOk };
});