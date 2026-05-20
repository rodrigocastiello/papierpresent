// cancel_call_off — moves a call-off to 'cancelled' after explicit confirm.
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

const confirmed = await utils.confirm({
  title: `Cancel ${co.code}?`,
  description: `This will mark the call-off for ${co.customer_name} as cancelled. The action is logged but not
reversible from this screen.`,
  confirmButtonText: "Cancel call-off",
  cancelButtonText: "Keep open",
});
if (!confirmed) return;

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
    await _GET_call_off_detail.trigger();
    await _GET_call_offs.trigger();
  },
  onFailure: (err) => {
    console.error("[cancel_call_off] update failed:", err);
  },
});
