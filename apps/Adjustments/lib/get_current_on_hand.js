//Current on-hand at the selected rack (falls back to the product total if no rack picked).
const placements = formatDataAsArray({{_GET_placements.data}}) || [];
const products   = formatDataAsArray({{_GET_products.data}}) || [];

const rackId = {{select4.value}};
const pid    = {{select3.value}};

if (rackId) {
const row = placements.find(p => p.location_id === rackId);
return row ? row.quantity : 0;
}
const prod = products.find(p => p.product_id === pid);
return prod ? prod.on_hand : 0;