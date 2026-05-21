const product = {{_selected_product.value}} || {};
const filter  = ({{textInput2 && textInput2.value}} || "").toLowerCase();  // textInput2 = drawer search
const jobs    = formatDataAsArray({{_GET_customer_artwork_jobs.data}}) || [];

const norm = (s) => String(s || "").toLowerCase().replace(/[^a-z0-9]+/g, " ").trim();
const tokens = (s) => norm(s).split(" ").filter(Boolean);

const scored = jobs.map(job => {
  const reasons = [];
  let score = 0;

  const sizesNorm = (job.sizes || []).map(norm);
  if (product.size && sizesNorm.includes(norm(product.size))) {
    score += 60;    
    reasons.push({ key: "size",    text: product.size });
  }

  const pToks = new Set(tokens(product.odoo_product_name));
  const aToks = new Set(tokens(job.artwork_job_name));
  const overlap = [...pToks].filter(t => aToks.has(t) && t.length > 2);
  if (overlap.length) {
    score += Math.min(30, overlap.length * 10);
    reasons.push({ key: "name", text: job.artwork_job_name });
  }
  if (product.customer_id === job.customer_id) {
    score += 10;
    reasons.push({ key: "customer", text: job.customer_name });
  } 
  
  return { ...job, score, reasons };
});

const filtered = filter
  ? scored.filter(j =>
      j.artwork_job_code?.toLowerCase().includes(filter) ||
      j.artwork_job_name?.toLowerCase().includes(filter) 
    ) 
  : scored;
  
filtered.sort((a, b) => (b.score - a.score) || a.artwork_job_code.localeCompare(b.artwork_job_code));

const suggested = filtered.find(j => j.score > 0) || null;
const others    = filtered.filter(j => j !== suggested);

return {
  suggested,
  others,
  others_count: others.length,
};
