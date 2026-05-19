const aggregates = formatDataAsArray({{ _GET_inventory.data }}) || [];

const sum = (key) => aggregates.reduce((s, a) => s + (Number(a[key]) || 0), 0);

return {
  artwork_jobs: aggregates.length,
  on_hand:      sum("on_hand"),
  reserved:     sum("reserved"),
  available:    sum("available"),
};