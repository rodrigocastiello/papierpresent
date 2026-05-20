// get_call_off_activity.js — synthesizes the activity timeline. The
// activity_log table doesn't exist yet, so events are derived from
// created_at / updated_at / state / lines. When that table lands, swap
// the body to read real events; the UI shape below is the contract.
//
// Returned shape (one entry per event):
//   { id, group, time, kind, actor, text, chips: [{label}], detail, meta }
//   group: "today" | "yesterday" | "may_21_2026" (anything sortable)
//   kind:  "created" | "line_added" | "state" | "picking" | "picked"
const co = get_call_off_detail.value;
const lines = get_call_off_detail_lines.value || [];
if (!co) return [];

const actor = (co.created_by_email || "luc.hendrickx@papierpresent.example").split("@")[0];
const created = moment(co.created_at);
const updated = moment(co.updated_at);
const state = co.state;

const groupOf = (m) => {
  const today = moment().startOf("day");
  const yesterday = today.clone().subtract(1, "day");
  if (m.isSameOrAfter(today)) return { key: "today", label: `TODAY · ${m.format("MMM D, YYYY").toUpperCase()}` };
  if (m.isSameOrAfter(yesterday)) return { key: "yesterday", label: `YESTERDAY · ${m.format("MMM D, 
YYYY").toUpperCase()}` };
  return { key: m.format("YYYY-MM-DD"), label: m.format("MMM D, YYYY").toUpperCase() };
};

const events = [];

// — created
events.push({
  id: "created",
  at: created.toISOString(),
  group: groupOf(created),
  time: created.format("HH:mm"), 
  kind: "created",
  actor,
  text: `**${actor}** created call-off for **${co.customer_name}**`,
  detail: `Source: phone order · ${co.code}`,
});

// — lines added (mocked: stagger by 1 minute each, on creation day)
lines.forEach((l, i) => {
  const at = created.clone().add(i + 1, "minutes");
  events.push({
    id: `line-add-${l.id}`,
    at: at.toISOString(),
    group: groupOf(at),
    time: at.format("HH:mm"),
    kind: "line_added",
    actor,
    text: `**${actor}** added line ${i + 1}`,
    chips: [{ label: l.p_number }],
    detail: `${l.quantity_requested} units`,
  });
});

// — state transitions (only the ones the current state implies)
if (state === "picking" || state === "shipped") {
  const at = updated.clone().subtract(2, "hours");
  events.push({
    id: "to-picking",
    at: at.toISOString(), 
    group: groupOf(at),
    time: at.format("HH:mm"),
    kind: "state",
    actor,
    text: `**${actor}** changed state · **Open → Picking**`,
  });
}

if (state === "shipped") {
  events.push({
    id: "to-shipped",
    at: updated.toISOString(),
    group: groupOf(updated),
    time: updated.format("HH:mm"),
    kind: "state",
    actor,
    text: `**${actor}** changed state · **Picking → Shipped**`,
  });
}

// — picking progress (mocked, mirrors get_call_off_detail_lines)
if (state === "picking" || state === "shipped") {
  lines.forEach((l, i) => {
    const fullyPicked = state === "shipped" || i < lines.length - 1;
    const at = updated.clone().subtract(fullyPicked ? (lines.length - i) * 30 : 0, "minutes");
    events.push({
      id: `pick-${l.id}`, 
      at: at.toISOString(),
      group: groupOf(at),
      time: at.format("HH:mm"),
      kind: fullyPicked ? "picked" : "picking",
      actor,
      text: fullyPicked
        ? `**${actor}** completed picking line ${i + 1}`
        : `**${actor}** is picking line ${i + 1}`,
      chips: [{ label: l.p_number }],
      detail: fullyPicked
        ? `${l.quantity_requested} of ${l.quantity_requested} units`
        : `${l.quantity_picked} of ${l.quantity_requested} units`,
      meta: !fullyPicked ? "In progress. Last touch 12 min ago" : null,
    });
  });
} 

// Newest first, then group label is applied in the ListView itself
events.sort((a, b) => new Date(b.at).getTime() - new Date(a.at).getTime());
return events;