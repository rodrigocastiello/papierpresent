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
      disabled="{{ (_lines.value || []).some(l => l.product_id != null) }}"
      emptyMessage="No options"
      formDataKey="customer_id"
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
      id="requestedDate"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      formDataKey="requested_date"
      iconBefore="bold/interface-calendar"
      label="Requested date"
      labelPosition="top"
      required={true}
      value="{{ new Date() }}"
    />
    <Date
      id="customerDeadlineDate"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      formDataKey="customer_deadline"
      iconBefore="bold/interface-calendar"
      label="Customer deadline"
      labelPosition="top"
    />
    <Text id="text1" value="**Delivery mode**" verticalAlign="center" />
    <Tabs
      id="deliveryTab"
      alignment="justify"
      itemMode="static"
      style={{}}
      value="{{ self.values[0] }}"
    >
      <Option
        id="00030"
        icon="line/shipping-transfer-truck"
        iconPosition="left"
        label="Warehouse dispatch"
        value="warehouse_dispatch"
      />
      <Option
        id="00031"
        icon="line/travel-map-navigation-arrow-north"
        iconPosition="left"
        label="Drop shipping"
        value="drop_shipping"
      />
    </Tabs>
    <TextArea
      id="notesTextArea"
      autoResize={true}
      formDataKey="notes"
      label="Notes"
      labelPosition="top"
      minLines={2}
      placeholder="Any context the warehouse should know. Phone-order reference, packing requests, customer preferences."
    />
  </View>
</Container>
