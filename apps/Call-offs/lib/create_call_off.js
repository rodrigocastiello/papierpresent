// create_call_off.js  — wired to form1's Submit event
const result = await validate_call_off.trigger();
if (!result.is_valid) {
  console.log("[create_call_off] blocked:", result.errors);
  return;
}

// Map the Tabs label to a DB slug
const deliveryModeMap = {
  "Warehouse dispatch": "warehouse_dispatch",
  "Drop shipping": "drop_shipping",
};

// Build the payload the SQL query reads via additionalScope.
// Empty strings → null, dates normalized to YYYY-MM-DD, tabs mapped to slug.
const payload = {
  customer_id: calloffForm.data.customer_id ?? null,
  requested_date: calloffForm.data.requested_date
    ? moment(calloffForm.data.requested_date).format("YYYY-MM-DD")
    : null,
  customer_deadline: calloffForm.data.customer_deadline
    ? moment(calloffForm.data.customer_deadline).format("YYYY-MM-DD")
    : null,
  notes: calloffForm.data.notes?.trim() ? calloffForm.data.notes : null,
  delivery_mode: deliveryModeMap[deliveryTab?.value] ?? null,
  lines: _lines.value || [],
}; 

try {
  await _CREATE_call_off.trigger({ additionalScope: { payload } });

  utils.showNotification({
    notificationType: "success",
    title: "Call-off created",
    description: "The warehouse will see it in the queue.",
  });

  // Reset client state
  await _lines.setValue([]);
  calloffForm.reset();
  linesTable.clearChangeset();

  // Navigate back to the list
  await go_to_list_page.trigger();
} catch (err) {
  console.error("[create_call_off] insert failed:", err);
  utils.showNotification({
    notificationType: "error",
    title: "Could not save call-off",
    description: String(err?.message || err),
  });
}
