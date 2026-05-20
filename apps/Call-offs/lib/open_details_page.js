// open_detail — triggered from the call-offs table row click.
// Pulls the call-off id out of additionalScope and navigates to the
// detail screen, exposing the id as ?call_off_id=... in the URL.
//
// Receives: { call_off_id } via additionalScope
if (!call_off_id) {
  console.warn("[open_detail] no call_off_id in additionalScope");
  return;
} 

utils.openPage("detail", {
  queryParams: { call_off_id },
});