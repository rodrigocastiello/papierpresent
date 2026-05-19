const aggregates = formatDataAsArray({{ _GET_inventory.data }}) || [];
const customerId = {{ inventoryCustomerSelect?.value }};

const scoped = customerId
  ? aggregates.filter(a => a.customer_id === customerId)
  : aggregates;

const sum = (key) => scoped.reduce((s, a) => s + (Number(a[key]) || 0), 0);

return {
  artwork_jobs: scoped.length,
  on_hand:      sum("on_hand"),
  reserved:     sum("reserved"),
  available:    sum("available"),
};
