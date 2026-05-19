try {
  _lines.setValue(
    _lines.value.filter((line) => line.id !== rowId)
  );
} catch (err) {
  console.error("[ERROR] Failed to remove call-off line:", err);
} finally {
  linesTable.clearChangeset();
}