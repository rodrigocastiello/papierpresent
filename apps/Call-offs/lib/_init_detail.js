const call_off_id = url.searchParams.call_off_id

if (!call_off_id) {
  console.warn("[_init_detail] no call_off_id in URL, skipping fetch");
  return;
}

await _GET_call_off_detail.trigger({
  additionalScope: {
    call_off_id,
  }
});
await _GET_call_off_detail_lines.trigger({
  additionalScope: {
    call_off_id,
  }
});