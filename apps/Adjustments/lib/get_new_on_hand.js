const current = Number({{get_current_on_hand.value}} || 0);
const delta   = Number({{numberInput2.value}} || 0);
return current + delta;