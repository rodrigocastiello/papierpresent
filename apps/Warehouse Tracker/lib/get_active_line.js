const callOffId = {{ _call_off_id.value }};
const activeId  = {{ _active_line_id.value }};
const pickQty   = {{ _pick_qty.value }};

const allLines = {{ formatDataAsArray(_GET_lines.data) || [] }};
const lines = allLines.filter(l => l.call_off_id === callOffId);
const active = lines.find(l => l.id === activeId);
if (!active) return null;

const idx = lines.findIndex(l => l.id === activeId) + 1; // 1-based for "Active line N"

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

const meta = [
  active.artwork_job_code,
  active.product_category,
  active.product_size,
  active.customer_name,
].filter(Boolean).join(' · ');

return {
  ...active,
  active_index: idx,
  total_lines: lines.length,
  meta_line: meta,
  picked_qty: picked,
  full_cartons: fullCartons,
  remainder_units: remainder,
  is_partial: isPartial,
  breakdown_text: breakdown,
  location_confirmed: !!active.location_confirmed_at,
};
