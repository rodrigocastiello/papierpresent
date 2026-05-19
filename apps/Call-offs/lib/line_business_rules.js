// line_business_rules.js  — JS query
// inputs from caller: changes (via additionalScope)

const rows       = _lines.value || [];
const products   = formatDataAsArray(_GET_products.data) || [];
const changesArr = Array.isArray(changes) ? changes : [];

// fast lookups
const changeById  = new Map(changesArr.map(c => [c.id, c]));
const productById = new Map(products.map(p => [p.product_id, p]));

// 1) Merge each change into its row, and stamp artwork_job_id from the chosen product
const merged = rows.map(row => { 
  const change = changeById.get(row.id);
  let r = change ? { ...row, ...change } : row;

  // Each product row is a (product × artwork-job) pairing → derive artwork_job_id
  if (r.product_id != null) { 
    const prod = productById.get(r.product_id);
    if (prod && r.artwork_job_id !== prod.artwork_job_id) {
      r = { ...r, artwork_job_id: prod.artwork_job_id };
    }
  } else if (r.artwork_job_id != null) {
    // Product cleared → clear the stamped artwork job too
    r = { ...r, artwork_job_id: null };
  }

  return r;
});

// 2) Dedupe only when BOTH keys are set — half-filled rows are preserved
const seen = new Set();
const unique = [];
for (const r of merged) {
  if (r.product_id == null || r.artwork_job_id == null) {
    unique.push(r);
    continue;
  }
  const key = `${r.product_id}|${r.artwork_job_id}`;
  if (seen.has(key)) continue;
  seen.add(key);
  unique.push(r);
}

return { rows: unique };