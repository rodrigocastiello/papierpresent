const lines = _lines.value || [];

_lines.setValue([
  ...lines,
  {
    id: uuid.v4(),
    product_id: null,
    artwork_job_id: null,
    quantity_requested: null,
  }
]);