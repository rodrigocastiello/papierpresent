// Wire the table row "Link" action → trigger this, passing the row.
// Use additionalScope: { row } and reference `row` directly here.
await _selected_product.setValue({
  product_id:        row.id,
  p_number:          row.p_number,
  odoo_product_name: row.odoo_product_name,
  customer_id:       row.customer_id,
  customer_name:     row.customer_name,
  customer_color:    row.customer_color,
  customer_initials: row.customer_initials,
  size:              row.size,
});

await _selected_artwork_job.setValue(null);
await _GET_customer_artwork_jobs.trigger();
drawerFrame1.setHidden(false);
