<Container
  id="container2"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  overflowType="hidden"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ background: "canvas", headerBackground: "surfacePrimary" }}
>
  <Header>
    <Select
      id="select1"
      captionByIndex="{{ item.sales_contact_email }}"
      data="{{ get_all_customers.value }}"
      emptyMessage="No options"
      iconBefore="line/interface-user-single"
      label=""
      labels="{{ item.name }}"
      labelWidth="20"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      textBefore="Customer"
      value=""
      values="{{ item.name }}"
    />
    <Multiselect
      id="multiselect1"
      emptyMessage="No options"
      itemMode="static"
      label=""
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select options"
      showSelectionIndicator={true}
      textBefore="Status"
      wrapTags={true}
    >
      <Option id="00030" color="#FEF3C7" value="Open" />
      <Option id="00031" color="#DBEAFE" value="Picking" />
      <Option id="00032" color="#D1FAE5" value="Shipped" />
      <Option
        id="9df32"
        color="#F3F4F6"
        disabled={false}
        hidden={false}
        value="Cancelled"
      />
    </Multiselect>
    <Select
      id="select2"
      emptyMessage="No options"
      iconBefore="line/interface-calendar"
      itemMode="static"
      label=""
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showClear={true}
      showSelectionIndicator={true}
      textBefore="Requested"
    >
      <Option id="00030" label="Last 7 days" value="7" />
      <Option id="00031" label="Last 30 days" value="30" />
      <Option id="00032" label="Last 365 days" value="365" />
    </Select>
    <TextInput
      id="textInput1"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search by call-off ID or customer"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ get_call_offs.value }}"
      defaultFilters={{
        0: {
          id: "9e42d",
          columnId: "a882b",
          operator: "includes",
          value: "{{ multiselect1?.value }}",
          disabled: false,
        },
        1: {
          id: "c759a",
          columnId: "1ad62",
          operator: "includes",
          value: "{{ select1?.value }}",
          disabled: false,
        },
      }}
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      heightType="auto"
      primaryKeyColumnId="aac1e"
      rowHeight="small"
      searchTerm="{{ textInput1.value }}"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="aac1e"
        alignment="left"
        editable="false"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="call_off_id"
        label="Call off ID"
        placeholder="Enter value"
        position="left"
        size={87}
        summaryAggregationMode="none"
      />
      <Column
        id="1ad62"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="customer"
        label="Customer"
        placeholder="Enter value"
        position="center"
        size={166}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="01247"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="requested"
        label="Requested"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a882b"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="state"
        label="State"
        optionList={{
          manualData: [
            { value: "Open", color: "#fef3c7" },
            { value: "Picking", color: "#dbeafe" },
            { value: "Shipped", color: "#d1fae5" },
            { value: "Cancelled", color: "#f3f4f6" },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={81}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="ad7f6"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="lines"
        label="Lines"
        placeholder="Enter value"
        position="center"
        size={54}
        summaryAggregationMode="none"
        valueOverride="{{ item }}"
      />
      <Column
        id="7487f"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="sum"
        key="created_by"
        label="Created by"
        optionList={{
          mode: "manual",
          manualData: [
            { value: "Rodrigo", color: "rgba(74, 143, 72, 1)" },
            { map: { value: "Martin" } },
          ],
        }}
        placeholder="Enter value"
        position="center"
        size={140}
        summaryAggregationMode="none"
      />
      <Column
        id="94466"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="updated"
        label="Updated"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
    </Table>
  </View>
</Container>
