// Returns a score 0..100 for an artwork-job vs the selected product.
const norm = (s) => String(s || "").toLowerCase().replace(/[^a-z0-9]+/g, " ").trim();
const tokens = (s) => norm(s).split(" ").filter(Boolean);

const product = _selected_product.value || {};
const job     = row;  // additionalScope from a ListView item or transformer

if (!product.product_id) return { score: 0, reasons: [] };

const reasons = [];
let score = 0;

const sizesNormalized = (job.sizes || []).map(norm);
if (product.size && sizesNormalized.includes(norm(product.size))) {
  score += 60;
  reasons.push({ key: "size", text: product.size });
}

const pToks = new Set(tokens(product.odoo_product_name));
const aToks = new Set(tokens(job.artwork_job_name));
const overlap = [...pToks].filter(t => aToks.has(t) && t.length > 2);
if (overlap.length) {
  score += Math.min(30, overlap.length * 10);
  reasons.push({ key: "name", text: overlap.join(", ") });
}

if (product.customer_id === job.customer_id) {
  score += 10;
  reasons.push({ key: "customer", text: job.customer_name });
}

return { score, reasons };