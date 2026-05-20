// get_call_off_activity.js — feeds the Event List widget (Grouped mode).
// Returns two parallel arrays the widget consumes:
//   items[i]       → HTML string for event i (rendered with renderAsHtml)
//   timestamps[i]  → ISO datetime for event i (used by group-by-day + sort)
//
// The widget does the day-grouping, sort, and time-label rendering, so the
// HTML only needs: kind kicker (colored), title, optional caption, optional
// meta. Real activity_log doesn't exist yet — derived from created_at /
// updated_at / state / lines; swap the body when the table lands, keep the
// { items, timestamps } contract.

const co = {{get_call_off_detail.value}};
const lines = {{get_call_off_detail_lines.value || []}};
if (!co) return { items: [], timestamps: [] };

const actor = (co.created_by_email || "luc.hendrickx@papierpresent.example").split("@")[0];
const created = moment(co.created_at);
const updated = moment(co.updated_at);
const state = co.state;

const KIND = {
  created:    { color: "#1e3a8a", kicker: "Created"      },
  line_added: { color: "#9ca3af", kicker: "Line added"   },
  state:      { color: "#f59e0b", kicker: "State change" },
  picking:    { color: "#f59e0b", kicker: "Picking"      },
  picked:     { color: "#10b981", kicker: "Picked"       },
  shipped:    { color: "#10b981", kicker: "Shipped"      },
  cancelled:  { color: "#6b7280", kicker: "Cancelled"    },
};

const chip = (t) =>
  `<span style="font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:11px;background:#f3f4f6;color:#37415
1;border-radius:4px;padding:1px 6px;margin-left:4px;">${t}</span>`;

const html = ({ kind, title, chips = [], detail, meta }) => {
  const k = KIND[kind] || KIND.created;                                         
  const chipHtml = chips.length ? chips.map(chip).join("") : "";
  const detailHtml = detail
    ? `<div style="font-size:12px;color:#6b7280;margin-top:2px;">${detail}</div>`
    : "";
  const metaHtml = meta
    ? `<div style="font-size:11px;color:#9ca3af;font-style:italic;margin-top:2px;">${meta}</div>`
    : "";
  return (
    `<div style="font-size:11px;color:${k.color};text-transform:uppercase;letter-spacing:0.4px;font-weight:600;">${k.kicker}</div>` +
    `<div style="font-size:13px;color:#111827;margin-top:2px;">${title}${chipHtml}</div>` +
    detailHtml +
    metaHtml
  );
};

const events = [];

events.push({
  at: created.toISOString(),
  kind: "created",
  title: `<b>${actor}</b> created call-off for <b>${co.customer_name}</b>`,
  detail: `Source: phone order · ${co.code}`,
});

lines.forEach((l, i) => {
  events.push({
    at: created.clone().add(i + 1, "minutes").toISOString(),
    kind: "line_added",
    title: `<b>${actor}</b> added line ${i + 1}`,
    chips: [l.p_number],
    detail: `${l.quantity_requested} units`,
  });
});

if (state === "picking" || state === "shipped") {                               
  events.push({
    at: updated.clone().subtract(2, "hours").toISOString(),
    kind: "state",
    title: `<b>${actor}</b> changed state · Open → <b>Picking</b>`,
  });
}

if (state === "shipped") {
  events.push({
    at: updated.toISOString(),
    kind: "state",
    title: `<b>${actor}</b> changed state · Picking → <b>Shipped</b>`,
  });
}

if (state === "picking" || state === "shipped") {
  lines.forEach((l, i) => {                                                     
    const fullyPicked = state === "shipped" || i < lines.length - 1;
    const at = updated
      .clone()
      .subtract(fullyPicked ? (lines.length - i) * 30 : 0, "minutes")
      .toISOString();
    events.push({
      at,
      kind: fullyPicked ? "picked" : "picking",
      title: fullyPicked
        ? `<b>${actor}</b> completed picking line ${i + 1}`
        : `<b>${actor}</b> is picking line ${i + 1}`,
      chips: [l.p_number],
      detail: fullyPicked
        ? `${l.quantity_requested} of ${l.quantity_requested} units`
        : `${l.quantity_picked} of ${l.quantity_requested} units`,
      meta: !fullyPicked ? "In progress · last touch 12 min ago" : null,
    });
  });
}

// EventList Grouped mode does its own sort, but emit in natural (asc) order
// so the parallel arrays stay aligned cleanly.
events.sort((a, b) => new Date(a.at) - new Date(b.at));

return {
  items: events.map(html),
  timestamps: events.map((e) => e.at),
};
