const raw = formatDataAsArray({{ _GET_inventory.data }}) || [];

const set = new Set();
for (const aj of raw) {
  if (aj.category) set.add(aj.category);
}

const categories = [...set].sort().map(c => ({
  label: c,
  value: c,
}));

return [{ label: "All categories", value: "all" }, ...categories];