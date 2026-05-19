// save_lines.js  — runs on every cell edit
const changeList = Array.isArray(changes) ? changes : [];
if (changeList.length === 0) return;

// 1) Hand the raw changes to the rules transformer, get back normalized rows
const { rows: updated } = await line_business_rules.trigger({
  additionalScope: { changes: changeList },
});

// 2) Commit the canonical state
await _lines.setValue(updated);

// 3) Wipe pending edits so the table's changeset resets cleanly
linesTable.clearChangeset();