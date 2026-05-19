const raw = formatDataAsArray({{ _GET_inventory.data }}) || [];
const customerId = {{ inventoryCustomerSelect?.value }};

const scoped = customerId
  ? raw.filter(a => a.customer_id === customerId)
  : raw;

const set = new Set();
for (const aj of scoped) {
  if (aj.category) set.add(aj.category);
}

const categories = [...set].sort().map(c => ({ label: c, value: c }));
return [{ label: "All categories", value: "all" }, ...categories];