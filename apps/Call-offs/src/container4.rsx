<Container
  id="container4"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle3"
      style={{ fontSize: "13px", fontWeight: "400", fontFamily: "Inter" }}
      value="**Customer & delivery**"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Select
      id="customerSelect"
      captionByIndex="{{ item.sales_contact_email }}"
      colorByIndex=""
      data="{{ get_customers.value }}"
      emptyMessage="No options"
      label="Customer"
      labelPosition="top"
      labels="{{ item.name }}"
      overlayMaxHeight={375}
      placeholder="Select an option"
      required={true}
      showSelectionIndicator={true}
      values="{{ item.id }}"
    />
    <Date
      id="date1"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="Requested date"
      labelPosition="top"
      required={true}
      value="{{ new Date() }}"
    />
    <Date
      id="date2"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="Customer deadline"
      labelPosition="top"
    />
    <Text id="text1" value="**Delivery mode**" verticalAlign="center" />
    <Tabs
      id="tabs1"
      alignment="justify"
      itemMode="static"
      style={{}}
      value="{{ self.values[0] }}"
    >
      <Option
        id="00030"
        icon="line/shipping-transfer-truck"
        iconPosition="left"
        value="Warehouse dispatch"
      />
      <Option
        id="00031"
        icon="line/travel-map-navigation-arrow-north"
        iconPosition="left"
        value="Drop shipping"
      />
    </Tabs>
    <TextArea
      id="textArea1"
      autoResize={true}
      label="Notes"
      labelPosition="top"
      minLines={2}
      placeholder="Any context the warehouse should know. Phone-order reference, packing requests, customer preferences."
    />
  </View>
</Container>
