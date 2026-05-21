const rows = formatDataAsArray({{_GET_products.data}}) || [];
return rows.map(r => ({
  value: r.product_id,
  label: r.p_number,
  caption: `${r.units_per_carton} u/carton · ${r.units_per_pallet ? r.units_per_pallet/r.units_per_carton + "cartons/pallet" : "—"}`,
  on_hand: r.on_hand,
  inventory_item_id: r.inventory_item_id,
  units_per_carton: r.units_per_carton,
  units_per_pallet: r.units_per_pallet,
}));