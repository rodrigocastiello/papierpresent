if (line_id == null) {
  throw new Error('Missing line_id');
}
const qty = Number(new_quantity_picked);
if (!Number.isFinite(qty) || qty < 0) {
  throw new Error('Invalid quantity');
}

await _PICK_line.trigger({
  additionalScope: {
    line_id,
    new_quantity_picked: qty,
    current_user_email: current_user.email,
  },
});

await Promise.all([
  _GET_lines.trigger(),
  _GET_call_offs.trigger(),
]);
