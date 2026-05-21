const product = _selected_product.value;
const name    = (nameInput.value || "").trim();
const category = categorySelect.value;

if (!product?.product_id || !name || !category) {
  utils.showNotification({
    notificationType: "warning", 
    title: "Missing fields",
    description: "Name and category are required.",
  });
  return;
}

await _CREATE_artwork_job.trigger({
  additionalScope: {
    payload: {
      name,
      category,
      customer_id: product.customer_id,
      product_id:  product.product_id,
    },
  },

  onSuccess: async (data) => {
    const row = (data && data[0]) || {};
    utils.showNotification({
      notificationType: "success",
      title: "Artwork-job created",
      description: `${product.p_number} → ${row.artwork_job_code}`,
    });
    drawerFrame1.setHidden(true);
    nameInput.resetValue();
    categorySelect.resetValue();
    await _selected_product.setValue(null);
    await _GET_unlinked_products.trigger();
    await _GET_recent_artwork_jobs.trigger();
    await _GET_artwork_jobs_stats.trigger();
  },

  onFailure: (err) => {
    console.error("[create_artwork_job] failed:", err);
    utils.showNotification({
      notificationType: "error",
      title: "Could not create artwork-job",
      description: String(err?.message || err),
    });
  },
});