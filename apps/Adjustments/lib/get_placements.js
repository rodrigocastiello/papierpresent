const rows = formatDataAsArray({{_GET_placements.data}}) || [];
return rows.map(r => ({
  value: r.location_id,
  label: r.rack_code,
  caption: `${Number(r.quantity).toLocaleString()} u · ${r.is_full_pallet ? "full pallet" : "partial pallet"}`,
  quantity: r.quantity,
  rack_code: r.rack_code,
  zone: r.zone,
}));