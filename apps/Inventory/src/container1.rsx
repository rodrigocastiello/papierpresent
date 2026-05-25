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
  style={{ background: "canvas", headerBackground: "surfacePrimary" }}
>
  <Header>
    <Container
      id="group8"
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
        <Button
          id="invExportButton"
          heightType="auto"
          iconBefore="line/interface-download-button-2"
          style={{}}
          styleVariant="outline"
          text="Export"
        />
        <Button
          id="button1"
          heightType="auto"
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
    <Text
      id="containerTitle1"
      style={{ map: { color: "primary" } }}
      value="#### Inventory"
      verticalAlign="center"
    />
    <Container
      id="group7"
      _align="end"
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
        <Container
          id="group5"
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
            <Statistic
              id="statistic1"
              currency="USD"
              label="ARTWORK-JOBS"
              positiveTrend="{{ self.value >= 0 }}"
              secondaryCurrency="USD"
              secondaryEnableTrend={true}
              secondaryFormattingStyle="percent"
              secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
              secondaryShowSeparators={true}
              secondarySignDisplay="trendArrows"
              secondaryValue=""
              showSeparators={true}
              value="{{ get_inventory_summary?.value?.artwork_jobs }}"
            />
            <Statistic
              id="statistic2"
              currency="USD"
              label="ON-HAND"
              positiveTrend="{{ self.value >= 0 }}"
              secondaryCurrency="USD"
              secondaryEnableTrend={true}
              secondaryFormattingStyle="percent"
              secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
              secondaryShowSeparators={true}
              secondarySignDisplay="trendArrows"
              secondaryValue=""
              showSeparators={true}
              value="{{ get_inventory_summary?.value?.on_hand }}"
            />
            <Statistic
              id="statistic3"
              currency="USD"
              label="RESERVED"
              positiveTrend="{{ self.value >= 0 }}"
              secondaryCurrency="USD"
              secondaryEnableTrend={true}
              secondaryFormattingStyle="percent"
              secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
              secondaryShowSeparators={true}
              secondarySignDisplay="trendArrows"
              secondaryValue=""
              showSeparators={true}
              value="{{ get_inventory_summary?.value?.reserved }}"
            />
            <Statistic
              id="statistic4"
              currency="USD"
              label="AVAILABLE"
              positiveTrend="{{ self.value >= 0 }}"
              secondaryCurrency="USD"
              secondaryEnableTrend={true}
              secondaryFormattingStyle="percent"
              secondaryPositiveTrend="{{ self.secondaryValue >= 0 }}"
              secondaryShowSeparators={true}
              secondarySignDisplay="trendArrows"
              secondaryValue=""
              showSeparators={true}
              value="{{ get_inventory_summary?.value?.available }}"
            />
          </View>
        </Container>
        <Select
          id="inventoryCustomerSelect"
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
          value="{{ self.data[0].id }}"
          values="{{ item.id }}"
        />
        <TextInput
          id="inventorySearch"
          iconBefore="bold/interface-search"
          label=""
          labelPosition="top"
          placeholder="Search by P-number, artwork-job or size"
        />
      </View>
    </Container>
    <Tabs
      id="inventoryCategoryTabs"
      data="{{ get_inventory_categories.value }}"
      labels="{{ item.label }}"
      style={{}}
      styleVariant="lineBottom"
      value="all"
      values="{{ item.value }}"
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
      enableExpandableRows={true}
      enableSaveActions={true}
      primaryKeyColumnId="c24bd"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Include src="./inventoryTableExpandedRow.rsx" />
      <Column
        id="c24bd"
        alignment="right"
        editable={false}
        format="decimal"
        groupAggregationMode="countDistinct"
        hidden="true"
        key="id"
        label="ID"
        position="center"
        size={27.796875}
        summaryAggregationMode="none"
      />
      <Column
        id="92c75"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="artwork_job_id"
        label="Artwork job ID"
        placeholder="Enter value"
        position="center"
        size={97.03125}
        summaryAggregationMode="none"
      />
      <Column
        id="246b9"
        alignment="left"
        caption="{{ currentSourceRow.artwork_job_name }}"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="artwork_job_code"
        label="Artwork job code"
        placeholder="Enter value"
        position="center"
        size={141.53125}
        summaryAggregationMode="none"
      />
      <Column
        id="2378d"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="size_display"
        label="Size display"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="14116"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        groupAggregationMode="none"
        key="p_number_display"
        label="P-number"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="386fd"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="on_hand"
        label="On hand"
        placeholder="Enter value"
        position="center"
        size={94.859375}
        summaryAggregationMode="none"
        valueOverride={'{{ item + "u" }}'}
      />
      <Column
        id="f21e8"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="reserved"
        label="Reserved"
        placeholder="Enter value"
        position="center"
        size={95.40625}
        summaryAggregationMode="none"
        valueOverride={'{{ item + "u" }}'}
      />
      <Column
        id="285a1"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="available"
        label="Available"
        placeholder="Enter value"
        position="center"
        size={100.28125}
        summaryAggregationMode="none"
        valueOverride={'{{ item + "u" }}'}
      />
      <Column
        id="0340f"
        alignment="left"
        cellTooltipMode="overflow"
        format="tags"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="racks_tags"
        label="Racks"
        optionList={{
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
      <Column
        id="04c57"
        alignment="left"
        editableOptions={{ spellCheck: false }}
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="artwork_job_name"
        label="Artwork job name"
        placeholder="Enter value"
        position="center"
        size={122.34375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="1c0e8"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="category"
        label="Category"
        placeholder="Select option"
        position="center"
        size={138.34375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="77f67"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="customer_id"
        label="Customer ID"
        placeholder="Enter value"
        position="center"
        size={91}
        summaryAggregationMode="none"
      />
      <Column
        id="ac72d"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="product_count"
        label="Product count"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8c19d"
        alignment="left"
        cellTooltipMode="overflow"
        format="tags"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="products"
        label="Products"
        placeholder="Select options"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
    </Table>
  </View>
</Container>
