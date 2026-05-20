const rows = {{formatDataAsArray(_GET_lines.data) || []}};

const iconByState = {
  complete:    'bold/interface-validation-check',
  in_progress: 'bold/interface-time-clock-circle',
  pending:     'line/interface-time-clock-circle',
};

const colorByState = {
  complete:    '#10B981',
  in_progress: '#F59E0B',
  pending:     '#9CA3AF',
};

return rows.map(r => {
  const subtitle = r.line_state === 'in_progress'
    ? `${r.quantity_picked} of ${r.quantity_requested} units · in progress`
    : `${r.quantity_requested} units`;

  return {
    ...r,
    icon:  iconByState[r.line_state]  || iconByState.pending,
    color: colorByState[r.line_state] || colorByState.pending,
    subtitle,
  };
});
