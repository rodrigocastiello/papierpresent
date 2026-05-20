const callOffId = {{ _call_off_id.value }};
const activeId  = {{ _active_line_id.value }};
const pickQty   = {{ _pick_qty.value }};

const allLines = {{ formatDataAsArray(_GET_lines.data) || [] }};
const lines = allLines.filter(l => l.call_off_id === callOffId);
const active = lines.find(l => l.id === activeId);
if (!active) return null;

const idx = lines.findIndex(l => l.id === activeId) + 1;

const upc = Number(active.units_per_carton) || 0;
const picked = Number(pickQty) || 0;
const fullCartons = upc > 0 ? Math.floor(picked / upc) : 0;
const remainder   = upc > 0 ? picked % upc : picked;
const isPartial   = remainder > 0;

const breakdown = upc === 0
  ? `${picked} units`
  : isPartial
    ? `${fullCartons} carton${fullCartons === 1 ? '' : 's'} + ${remainder} units`
    : `${fullCartons} carton${fullCartons === 1 ? '' : 's'}`;

const metaLine1 = [
  active.artwork_job_code,
  active.product_category,
].filter(Boolean).join(' · ');

const metaLine2 = active.product_size || '';

const statusLabel = {
  pending:     null,
  in_progress: 'PARTIAL',
  complete:    'COMPLETE',
}[active.line_state];

const statusColor = {
  pending:     null,
  in_progress: { bg: '#FEF3C7', text: '#92400E' },
  complete:    { bg: '#D1FAE5', text: '#065F46' },
}[active.line_state];


return {
  ...active,
  active_index: idx,
  total_lines: lines.length,
  meta_line1: metaLine1,
  meta_line2: metaLine2,
  picked_qty: picked,
  full_cartons: fullCartons,
  remainder_units: remainder,
  is_partial: isPartial,
  breakdown_text: breakdown,
  location_confirmed: !!active.location_confirmed_at,
  status_label: statusLabel,
  status_color_bg: statusColor?.bg,
  status_color_text: statusColor?.text,
};