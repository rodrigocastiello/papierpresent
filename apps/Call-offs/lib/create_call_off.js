// create_call_off.js  — wired to calloffForm's Submit event
const result = await validate_call_off.trigger();
if (!result.is_valid) {
  console.log("[create_call_off] blocked:", result.errors);
  return;
}

const payload = {
  customer_id: calloffForm.data.customer_id ?? null,
  requested_date: calloffForm.data.requested_date
    ? moment(calloffForm.data.requested_date).format("YYYY-MM-DD")
    : null,
  customer_deadline: calloffForm.data.customer_deadline
    ? moment(calloffForm.data.customer_deadline).format("YYYY-MM-DD")
    : null,
  notes: calloffForm.data.notes?.trim() ? calloffForm.data.notes : null,
  delivery_mode: deliveryTab?.value || null,
  lines: _lines.value || [],  
};

// Hard guard — if anything required is missing, fail fast without touching the DB.
if (!payload.customer_id || !payload.requested_date || !payload.delivery_mode || payload.lines.length === 0) {
  utils.showNotification({
    notificationType: "warning", 
    title: "Cannot save",
    description: "Missing customer, requested date, delivery mode, or lines.",
  });
  return;
}

await _CREATE_call_off.trigger({
  additionalScope: { payload },

  onSuccess: async () => {
    utils.showNotification({
      notificationType: "success",
      title: "Call-off created",
      description: "The warehouse will see it in the queue.",
    });

    await _lines.setValue([]);
    calloffForm.reset();
    linesTable.clearChangeset();

    // Refresh the list before navigating so the new row is visible
    await _GET_call_offs.trigger();
    await open_list_page.trigger();
  },

  onFailure: (err) => {
    console.error("[create_call_off] insert failed:", err);
    utils.showNotification({
      notificationType: "error",
      title: "Could not save call-off",
      description: String(err?.message || err),
    });
    // Note: no reset, no navigation. User stays on the form with their data.
  },
});
