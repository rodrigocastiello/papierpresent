<ExpandedRow id="inventoryTableExpandedRow">
  <Table
    id="table1"
    cellSelection="none"
    clearChangesetOnSave={true}
    data="{{ currentSourceRow.products }}"
    defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
    emptyMessage="No rows found"
    enableSaveActions={true}
    heightType="auto"
    hidden="{{ currentSourceRow.product_count === 1 }}"
    margin="0"
    rowHeight="medium"
    toolbarPosition="bottom"
  >
    <Column
      id="84fab"
      alignment="right"
      editable="false"
      editableOptions={{ showStepper: true }}
      format="decimal"
      formatOptions={{ showSeparators: true, notation: "standard" }}
      groupAggregationMode="sum"
      hidden="true"
      key="product_id"
      label="Product ID"
      placeholder="Enter value"
      position="center"
      size={100}
      summaryAggregationMode="none"
    />
    <Column
      id="6bb3c"
      alignment="left"
      editableOptions={{ spellCheck: false }}
      format="string"
      groupAggregationMode="none"
      key="size"
      label="Size"
      placeholder="Enter value"
      position="center"
      size={100}
      summaryAggregationMode="none"
    />
    <Column
      id="12baf"
      alignment="left"
      editableOptions={{ spellCheck: false }}
      format="string"
      groupAggregationMode="none"
      key="p_number"
      label="P number"
      placeholder="Enter value"
      position="center"
      size={100}
      summaryAggregationMode="none"
    />
    <Column
      id="33aa3"
      alignment="left"
      editableOptions={{ spellCheck: false }}
      format="string"
      formatOptions={{ showSeparators: true, notation: "standard" }}
      groupAggregationMode="sum"
      key="on_hand"
      label="On hand"
      placeholder="Enter value"
      position="center"
      size={100}
      summaryAggregationMode="none"
      valueOverride={'{{ item + "u" }}'}
    />
    <Column
      id="83625"
      alignment="left"
      editableOptions={{ spellCheck: false }}
      format="string"
      formatOptions={{ showSeparators: true, notation: "standard" }}
      groupAggregationMode="sum"
      key="reserved"
      label="Reserved"
      placeholder="Enter value"
      position="center"
      size={91}
      summaryAggregationMode="none"
      valueOverride={'{{ item + "u" }}'}
    />
    <Column
      id="99076"
      alignment="left"
      editableOptions={{ spellCheck: false }}
      format="string"
      formatOptions={{ showSeparators: true, notation: "standard" }}
      groupAggregationMode="sum"
      key="available"
      label="Available"
      placeholder="Enter value"
      position="center"
      size={100}
      summaryAggregationMode="none"
      valueOverride={'{{ item + "u" }}'}
    />
    <Column
      id="9c612"
      alignment="left"
      cellTooltipMode="overflow"
      format="tags"
      formatOptions={{ automaticColors: true }}
      groupAggregationMode="none"
      hidden="true"
      key="racks"
      label="Racks"
      placeholder="Select options"
      position="center"
      size={100}
      summaryAggregationMode="none"
    />
    <Column
      id="85a7a"
      alignment="left"
      editableOptions={{ spellCheck: false }}
      format="string"
      groupAggregationMode="none"
      placeholder="Enter value"
      position="left"
      referenceId="x"
      size={163}
      summaryAggregationMode="none"
    />
    <Column
      id="acd41"
      alignment="left"
      cellTooltipMode="overflow"
      editableOptions={{ allowCustomValue: true }}
      format="tags"
      formatOptions={{ automaticColors: true }}
      groupAggregationMode="none"
      key="racks_tags"
      label="Racks tags"
      optionList={{
        manualData: [],
        mode: "mapped",
        mappedData: "{{ get_rack_tag_options.value }}",
        valueByIndex: "{{ item.value }}",
        labelByIndex: "{{ item.label }}",
        colorByIndex: "{{ item.color }}",
      }}
      placeholder="Select options"
      position="center"
      size={100}
      summaryAggregationMode="none"
    />
  </Table>
</ExpandedRow>
