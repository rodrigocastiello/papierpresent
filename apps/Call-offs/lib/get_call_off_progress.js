// get_call_off_progress.js — totals for the Lines card header.
// Sums quantity_requested / quantity_picked across all visible lines
// and computes a clamped percentage (0–100) for the progress bar.
const lines = {{ get_call_off_detail_lines.value || [] }};

const requested = lines.reduce((acc, l) => acc + (Number(l.quantity_requested) || 0), 0);
const picked    = lines.reduce((acc, l) => acc + (Number(l.quantity_picked) || 0), 0);
const pct       = requested === 0 ? 0 : Math.min(100, Math.round((picked / requested) * 100));

return {
  requested,
  picked,
  pct, 
  label: `Picked **${picked}** of **${requested}** units`,
  pct_label: `**${pct}%**`,
  is_complete: pct === 100 && requested > 0,
};
