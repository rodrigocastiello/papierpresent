const customerId = {{ customerSelect.value }};

if (!customerId) return [];

const products = {{ formatDataAsArray(_GET_products.data) || [] }};

return products
  .filter(p => p.customer_id === customerId)
  .map(p => {
    // Compute "already on line N" by checking _lines
    const existingLine = ({{ _lines.value || [] }})
      .findIndex(l => l.product_id === p.product_id);

    return {
      ...p,
      label: `${p.artwork_job_code} · ${p.product_name} · ${p.product_size} (${p.product_code})`,
      sublabel: `racks ${p.racks.join(', ')}`,
      already_on_line: existingLine >= 0 ? existingLine + 1 : null,
    };
  });