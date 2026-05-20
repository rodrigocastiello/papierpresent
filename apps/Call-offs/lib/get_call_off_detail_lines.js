// get_call_off_detail_lines.js — shapes lines for the read-only detail
// table. Picked-progress columns are NOT yet persisted, so we synthesize
// plausible values from the call-off state:
//   open      → 0 picked
//   picking   → all but the last line fully picked; last line at 50%
//   shipped   → all lines fully picked
//   cancelled → keep whatever was picked before (mocked as 0)
const lines = formatDataAsArray({{ _GET_call_off_detail_lines.data }}) || [];
const co = {{get_call_off_detail.value}};

const state = co?.state || "open";
const total = lines.length;

return lines.map((r, i) => {
  const requested = Number(r.quantity_requested) || 0;
  const cartonSize = Number(r.units_per_carton) || 25;

  // Mocked picked qty
  let picked = 0;
  if (state === "picking") {
    picked = i < total - 1 ? requested : Math.floor(requested * 0.5);
  } else if (state === "shipped") {
    picked = requested;
  }

  const fullCartons = Math.floor(picked / cartonSize);
  const remainderUnits = picked - fullCartons * cartonSize;
  const pickedCartonsLabel =
    picked === 0
      ? "—"
      : remainderUnits === 0
      ? `${fullCartons} carton${fullCartons === 1 ? "" : "s"} (${cartonSize} units/carton)`
      : `${fullCartons} carton${fullCartons === 1 ? "" : "s"} + ${remainderUnits} units`;

  const racksArr = Array.isArray(r.racks) ? r.racks : [];
  const progressPct = requested === 0 ? 0 : Math.round((picked / requested) * 100);

  return {
    id: r.id,
    seq: i + 1,
    p_number: r.product_code || "—",
    artwork_job_code: r.artwork_job_code || "—",
    product_sub: [r.product_name, r.product_size].filter(Boolean).join(" · "),
    rack: racksArr[0] || "—",
    quantity_requested: requested,
    quantity_picked: picked,
    progress_pct: progressPct,
    progress_label: progressPct === 100 ? "100%" : `${progressPct}%`,
    picked_cartons_label: pickedCartonsLabel,
    notes:
      picked === 0
        ? ""
        : picked < requested
        ? "Partial pick. Confirm count"
        : "",
    is_partial: picked > 0 && picked < requested,
    is_done: picked === requested && requested > 0,
  };
});
