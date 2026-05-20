await _CONFIRM_location.trigger({
  additionalScope: { line_id: _active_line_id.value },
});
await _GET_lines.trigger();