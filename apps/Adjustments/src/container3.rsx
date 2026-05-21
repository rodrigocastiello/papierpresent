<Container
  id="container3"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle3"
      style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Inter" }}
      value="**Inventory item**"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Select
      id="select1"
      captionByIndex="{{ item.caption }}"
      data="{{ get_customers.value }}"
      emptyMessage="No options"
      label="Customer"
      labelPosition="top"
      labels="{{ item.label }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      values="{{ item.value }}"
    >
      <Event
        id="e46fc5fe"
        event="change"
        method="trigger"
        params={{}}
        pluginId="_GET_artwork_jobs"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select2"
      captionByIndex="{{ item.caption }}"
      data="{{ get_artwork_jobs.value }}"
      disabled="{{ !select1.value }}"
      emptyMessage="No options"
      label="Artowork-job"
      labelPosition="top"
      labels="{{ item.label }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      values="{{ item.value }}"
    >
      <Event
        id="40480f66"
        event="change"
        method="trigger"
        params={{}}
        pluginId="_GET_products"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select3"
      captionByIndex="{{ item.caption }}"
      data="{{ get_products.value }}"
      disabled="{{ !select2.value }}"
      emptyMessage="No options"
      label="P-number"
      labelPosition="top"
      labels="{{ item.label }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      values="{{ item.value }}"
    >
      <Event
        id="3b785731"
        event="change"
        method="trigger"
        params={{}}
        pluginId="_GET_placements"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Select
      id="select4"
      captionByIndex="{{ item.caption }}"
      data="{{ get_placements.value }}"
      disabled="{{ !select3.value }}"
      emptyMessage="No options"
      label="Rack"
      labelPosition="top"
      labels="{{ item.label }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      values="{{ item.value }}"
    />
    <Text
      id="text2"
      style={{
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
        color: "#8d9194",
      }}
      value="Leave blank to debit FIFO across all placements."
      verticalAlign="center"
    />
  </View>
</Container>
