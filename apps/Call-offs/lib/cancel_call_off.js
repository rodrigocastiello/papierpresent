// cancel_call_off — moves a call-off to 'cancelled'.
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

await _UPDATE_call_off_state.trigger({
  additionalScope: {
    call_off_id: co.id,
    new_state: "cancelled",
  },
  onSuccess: async () => {
    utils.showNotification({
      notificationType: "success",
      title: `${co.code} cancelled`,
      description: `${co.customer_name} · marked as cancelled.`,
    });
    await _init_detail.trigger();
  },
  onFailure: (err) => {
    console.error("[cancel_call_off] update failed:", err);
    utils.showNotification({
      notificationType: "error",
      title: "Cancel failed",
      description: err?.message || `Could not cancel ${co.code}.`,
    });
  },
});