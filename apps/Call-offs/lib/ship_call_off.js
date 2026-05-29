// ship_call_off — moves a call-off from picking → shipped.
// Guards: not already terminal AND all lines fully picked.
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

const progress = get_call_off_progress.value;
if (!progress?.is_complete) {
  utils.showNotification({
    notificationType: "warning",
    title: "Lines not fully picked",
    description: `Only ${progress?.picked ?? 0} of ${progress?.requested ?? 0} units picked. Finish picking first.`,
  });
  return;
} 

await _UPDATE_call_off_state.trigger({
  additionalScope: {
    call_off_id: co.id,
    new_state: "shipped",
  },
  onSuccess: async () => {
    utils.showNotification({
      notificationType: "success", 
      title: `${co.code} shipped`,
      description: `${co.customer_name} · marked as shipped.`,
    });
    await _init_detail.trigger();
  },
  onFailure: (err) => {
    console.error("[ship_call_off] update failed:", err);
  },
});
