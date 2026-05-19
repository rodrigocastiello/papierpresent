<Container
  id="container1"
  enableFullBleed={true}
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  overflowType="hidden"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Container
      id="group1"
      _align="center"
      _gap="0px"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
    >
      <View id="00030" viewKey="View 1">
        <Text
          id="containerTitle1"
          style={{ map: { color: "primary" } }}
          value="#### Inventory"
          verticalAlign="center"
        />
        <Button
          id="invExportButton"
          iconBefore="line/interface-download-button-2"
          style={{}}
          styleVariant="outline"
          text="Export"
        />
        <Button
          id="button1"
          iconBefore="line/interface-arrows-synchronize"
          text="Refresh"
        >
          <Event
            id="d0fc3bea"
            event="click"
            method="trigger"
            params={{}}
            pluginId="_GET_inventory"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <Spacer id="spacer1" />
    <Select
      id="selectCustomer"
      captionByIndex="{{ item.sales_contact_email }}"
      data="{{ get_all_customers.value }}"
      emptyMessage="No options"
      iconBefore="line/interface-user-single"
      label=""
      labelPosition="top"
      labels="{{ item.name }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      textBefore="Customer"
      values="{{ item.id }}"
    />
    <Tabs
      id="inventoryCategoryTabs"
      data="{{ get_inventory_categories.value }}"
      labels="{{ item.label }}"
      value="all"
      values="{{ item.value }}"
    />
    <TextInput
      id="textInput1"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search by P-number, artwork-job or size"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Table
      id="inventoryTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ get_inventory.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="c24bd"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="c24bd"
        alignment="right"
        format="decimal"
        groupAggregationMode="countDistinct"
        key="id"
        label="ID"
        position="center"
        size={32}
        summaryAggregationMode="none"
      />
      <Column
        id="e7af2"
        alignment="left"
        caption="{{ currentSourceRow.email }}"
        format="avatar"
        groupAggregationMode="none"
        key="email"
        label="User"
        position="center"
        referenceId="name"
        size={250}
        summaryAggregationMode="none"
        valueOverride="{{ currentSourceRow.firstName }} {{ currentSourceRow.lastName }}"
      />
      <Column
        id="a1fc1"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="role"
        label="Role"
        placeholder="Select option"
        position="center"
        size={72}
        summaryAggregationMode="none"
      />
      <Column
        id="a44ca"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        key="enabled"
        label="Enabled"
        position="center"
        size={64}
        summaryAggregationMode="none"
      />
      <Column
        id="4a65a"
        alignment="left"
        format="date"
        groupAggregationMode="none"
        key="createdAt"
        label="Created at"
        position="center"
        size={96}
        summaryAggregationMode="none"
      />
      <Column
        id="3a51c"
        alignment="left"
        cellTooltipMode="overflow"
        format="tags"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="teams"
        label="Teams"
        placeholder="Select options"
        position="center"
        size={260}
        summaryAggregationMode="none"
      />
      <Column
        id="349e1"
        alignment="left"
        format="link"
        groupAggregationMode="none"
        key="website"
        label="Website"
        position="center"
        size={200}
        summaryAggregationMode="none"
      />
      <Column
        id="b0efc"
        alignment="left"
        cellTooltipMode="overflow"
        format="multilineString"
        groupAggregationMode="none"
        key="text"
        label="Bio"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          id="60449106"
          event="clickToolbar"
          method="exportData"
          pluginId="inventoryTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          id="88775bf6"
          event="clickToolbar"
          method="refresh"
          pluginId="inventoryTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
