// get_call_off_detail.js — shapes the single call-off row for the UI:
// adds the state-step index, the formatted delivery mode label, and a
// mocked delivery charge derived from the mode. Returns null while loading.
const rows = formatDataAsArray({{ _GET_call_off_detail.data }}) || [];
const row = rows[0] || null;
if (!row) return null;

const STATE_META = {
  open:      { label: "Open",      step: 1, color: "#fef3c7" },
  picking:   { label: "Picking",   step: 2, color: "#dbeafe" },
  shipped:   { label: "Shipped",   step: 3, color: "#d1fae5" },
  cancelled: { label: "Cancelled", step: 4, color: "#f3f4f6" },
};
const meta = STATE_META[row.state] || { label: row.state, step: 0, color: "#e5e7eb" };

const DELIVERY_LABEL = {
  warehouse_dispatch: "Warehouse dispatch",
  drop_ship:          "Drop shipping",
};

// Mocked delivery charge — table doesn't track this yet
const deliveryCharge = row.delivery_mode === "warehouse_dispatch" ? 25 : 0;

// Days-to-deadline (positive = future)
const daysToDeadline = row.customer_deadline
  ? moment(row.customer_deadline).startOf("day").diff(moment().startOf("day"), "days")
  : null;

return {
  ...row, 
  state_label: meta.label,
  state_step: meta.step,           // 1..4, drives the pipeline highlight
  state_color: meta.color,
  is_cancelled: row.state === "cancelled",
  is_shipped: row.state === "shipped",
  is_terminal: row.state === "shipped" || row.state === "cancelled",
  delivery_mode_label: DELIVERY_LABEL[row.delivery_mode] || "—",
  delivery_charge_amount: deliveryCharge,
  delivery_charge_label: `€ ${deliveryCharge.toFixed(2).replace(".", ",")}`,
  days_to_deadline: daysToDeadline,
  days_to_deadline_label:
    daysToDeadline == null
      ? "—"
      : daysToDeadline === 0
      ? "today"
      : daysToDeadline < 0
      ? `${Math.abs(daysToDeadline)} days late`
      : `${daysToDeadline} days`,
};
