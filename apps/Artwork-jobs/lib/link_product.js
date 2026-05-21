const product = _selected_product.value;
const job     = _selected_artwork_job.value;

if (!product?.product_id || !job?.artwork_job_id) {
  utils.showNotification({
    notificationType: "warning",
    title: "Pick an artwork-job",
    description: "Select a card on the right before linking.",
  });
  return;
}

await _LINK_product_to_artwork_job.trigger({
  additionalScope: {
    payload: { product_id: product.product_id, artwork_job_id: job.artwork_job_id },
  },

  onSuccess: async () => {
    utils.showNotification({
      notificationType: "success",
      title: "Product linked",
      description: `${product.p_number} → ${job.artwork_job_code}`,
    });
    drawerFrame1.setHidden(true);
    await _selected_product.setValue(null);
    await _selected_artwork_job.setValue(null);
    await _GET_unlinked_products.trigger();
    await _GET_recent_artwork_jobs.trigger();
    await _GET_artwork_jobs_stats.trigger();
  },

  onFailure: (err) => {
    console.error("[link_product] failed:", err);
    utils.showNotification({
      notificationType: "error",
      title: "Could not link",
      description: String(err?.message || err),
    });
  },
});
