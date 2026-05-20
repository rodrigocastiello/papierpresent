// cancel_call_off — mockup stub. Real impl needs a confirm modal + DB write.
const co = get_call_off_detail.value;
if (!co) return;
if (co.is_terminal) {
  utils.showNotification({
    notificationType: "warning",
    title: "Already final",
    description: `${co.code} is ${co.state_label.toLowerCase()}.`,
  });
  return;
} 

utils.showNotification({
  notificationType: "info",
  title: `${co.code} cancelled`,
  description: "Mock cancel — replace with a confirm modal before wiring real DB.",
});