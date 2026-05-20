// ship_call_off — mockup stub. Real impl will move state to 'shipped'
// and stamp shipped_at + shipped_by. For now, just toast.
const co = get_call_off_detail.value;
if (!co) return;
if (co.is_terminal) { 
  utils.showNotification({
    notificationType: "warning",
    title: "Already final",
    description: `${co.code} is ${co.state_label.toLowerCase()}. Nothing to ship.`,
  });
  return;
} 

// In the real flow we'd also assert every line is fully picked.
utils.showNotification({
  notificationType: "success",
  title: `${co.code} shipped`,
  description: `${co.customer_name} · marked as shipped (mock).`,
});
