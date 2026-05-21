const customers  = formatDataAsArray({{_GET_customers.data}}) || [];
const aJobs      = formatDataAsArray({{_GET_artwork_jobs.data}}) || [];
const products   = formatDataAsArray({{_GET_products.data}}) || [];
const placements = formatDataAsArray({{_GET_placements.data}}) || [];

const customer   = customers.find(c => c.customer_id   === {{select1.value}});
const artworkJob = aJobs.find(a   => a.artwork_job_id  === {{select2.value}});
const product    = products.find(p => p.product_id     === {{select3.value}});
const rack       = placements.find(r => r.location_id  === {{select4.value}});

const current = Number({{get_current_on_hand.value}} || 0);
const delta   = Number({{numberInput2.value}} || 0);

return {
  id:             "auto",
  created_at:     moment().format("YYYY-MM-DD HH:mm:ss"),
  actor:          {{current_user.email}} || "—",
  customer:       customer?.customer_name        || "—",
  artwork_job:    artworkJob?.artwork_job_code   || "—",
  p_number:       product?.p_number              || "—",
  rack:           rack?.rack_code                || "—",
  on_hand_before: current,
  delta:          delta,
  on_hand_after:  current + delta,
  reason_code:    {{select5.value}}              || "—",
  reason_detail:  ({{textArea1.value}} || "").trim() || "—",
  reversible_by:  "offsetting adjustment only",
};