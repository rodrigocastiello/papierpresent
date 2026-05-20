const selected = {{ get_call_offs.value.find(co => co.id === _call_off_id.value) }};
  const lines = {{ formatDataAsArray(_GET_lines.data).filter(l => l.call_off_id === _call_off_id.value) }};

return {
  ...selected,
  lines
};