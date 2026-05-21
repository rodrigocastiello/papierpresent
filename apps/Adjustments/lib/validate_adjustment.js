const errors = [];

if (!select1.value) errors.push("Customer is required.");
if (!select2.value) errors.push("Artwork-job is required.");
if (!select3.value) errors.push("P-number is required.");
if (!select4.value) errors.push("Rack is required (pick the placement to adjust).");

const delta = Number(numberInput2.value || 0);
if (!Number.isFinite(delta) || delta === 0) errors.push("Adjustment quantity must be non-zero.");

const current = Number(get_current_on_hand.value || 0);
if (current + delta < 0) errors.push("New on-hand cannot be negative at the selected rack.");

if (!select5.value) errors.push("Reason code is required.");
const detail = (textArea1.value || "").trim();
if (!detail) errors.push("Reason detail is required.");

return { is_valid: errors.length === 0, errors };