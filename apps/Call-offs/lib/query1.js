const products = formatDataAsArray(_GET_products.data) || [];
const lineRow = _lines.value?.[0];

return {
  line_product_id: lineRow?.product_id,
  line_product_id_type: typeof lineRow?.product_id,
  first_product: products[0],
  match: products.find(p => p.product_id === lineRow?.product_id),
  match_loose: products.find(p => String(p.product_id) === String(lineRow?.product_id)),
}; 