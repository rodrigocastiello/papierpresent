const result = await validate_adjustment.trigger();
if (!result.is_valid) {
  utils.showNotification({
    notificationType: "warning",
    title: "Cannot record adjustment",
    description: result.errors.join(" "),
  });
  return;
}

const payload = {
  customer_id:    select1.value,
  artwork_job_id: select2.value,
  product_id:     select3.value,
  location_id:    select4.value,
  delta:          Number(numberInput2.value || 0),
  reason_code:    select5.value,
  reason_detail:  (textArea1.value || "").trim(),
};

await _CREATE_adjustment.trigger({
  additionalScope: { payload },

  onSuccess: async (data) => {
    utils.showNotification({
      notificationType: "success",
      title: "Adjustment recorded",
      description: `${payload.delta > 0 ? "+" : ""}${payload.delta} u · audit row written.`,
    });
    form1.reset();
    await open_list_page.trigger();
  },

  onFailure: (err) => {
    console.error("[create_adjustment] failed:", err);
    utils.showNotification({
      notificationType: "error",
      title: "Could not record adjustment",
      description: String(err?.message || err),
    });
  },
});