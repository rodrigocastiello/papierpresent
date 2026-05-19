const rows = [
  // within last 7 days
  {
    call_off_id: "CO-00122",
    customer: "Heritage Belgium",
    requested: "2026-05-19",
    state: "Open",
    lines: "1 line",
    created_by: "Rodrigo",
    updated: "2026-05-19T09:00:00Z",
  },
  {
    call_off_id: "CO-00124",
    customer: "Maison Velvet",
    requested: "2026-05-15",
    state: "Open",
    lines: "1 line",
    created_by: "Martin",
    updated: "2026-05-15T12:00:00Z",
  },

  // within last 30 days (but outside last 7)
  {
    call_off_id: "CO-00125",
    customer: "Lab9 Brussels",
    requested: "2026-05-05",
    state: "Open",
    lines: "1 line",
    created_by: "Rodrigo",
    updated: "2026-05-05T09:00:00Z",
  },
  {
    call_off_id: "CO-00129",
    customer: "Maison Velvet",
    requested: "2026-04-25",
    state: "Open",
    lines: "1 line",
    created_by: "Rodrigo",
    updated: "2026-04-25T12:00:00Z",
  },

  // within last 365 days (but outside last 30)
  {
    call_off_id: "CO-00127",
    customer: "Heritage Belgium",
    requested: "2026-02-10",
    state: "Open",
    lines: "2 lines",
    created_by: "Martin",
    updated: "2026-02-10T07:00:00Z",
  },
  {
    call_off_id: "CO-00123",
    customer: "Atelier Nord",
    requested: "2025-08-15",
    state: "Picking",
    lines: "3 lines",
    created_by: "Martin",
    updated: "2025-08-15T11:00:00Z",
  },
];

// selected filter value (ex: 7, 30, 365)
const days = Number({{select2?.value}});

// if invalid/no filter, return all rows
if (!Number.isFinite(days) || days <= 0) {
  return rows;
}

// cutoff date
const cutoff = moment()
  .subtract(days, "days")
  .startOf("day");

// filter rows
return rows.filter((row) =>
  moment(row.requested).isSameOrAfter(cutoff)
);