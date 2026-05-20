await Promise.all([
  _GET_call_offs.trigger(),
  _GET_lines.trigger(),
]);