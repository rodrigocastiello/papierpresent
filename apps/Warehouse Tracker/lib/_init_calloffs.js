await Promise.all([
  _GET_calloffs.trigger(),
  _GET_lines.trigger(),
]);