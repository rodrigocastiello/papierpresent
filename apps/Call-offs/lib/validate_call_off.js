// validate_call_off.js
const errors = [];

// 1) Built-in form fields (Select/Dates/TextArea, with required={true})
const formValid = await calloffForm.validate();
if (!formValid) errors.push("form");

// 2) Delivery mode — Tabs isn't form-aware, validate manually
if (!deliveryTab?.value) {
  errors.push("delivery_mode");
  utils.showNotification({
    notificationType: "warning",
    title: "Pick a delivery mode",
  });
}

// 3) At least one line
const lines = get_lines.value || [];
if (lines.length === 0) {
  errors.push("lines_empty");
  utils.showNotification({
    notificationType: "warning",
    title: "No lines",
    description: "Add at least one line before submitting.",
  });
}

// 4) Every line must be valid (product + artwork + qty within stock)
if (lines.length > 0 && !lines.every(l => l.is_valid === true)) {
  errors.push("lines_invalid");
  utils.showNotification({
    notificationType: "warning",
    title: "Invalid lines",
    description: "Fix the red rows before submitting.",
  });
}

return {
  is_valid: errors.length === 0,
  errors,
};
