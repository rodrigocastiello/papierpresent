<Container
  id="container6"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ background: "canvas", headerBackground: "surfacePrimary" }}
>
  <Header>
    <Breadcrumbs
      id="breadcrumbs2"
      itemMode="static"
      style={{ map: { currentPageText: "primary" } }}
      value="{{ retoolContext.appUuid }}"
    >
      <Option
        id="00030"
        itemType="page"
        label="Call-offs"
        screenTargetId="list"
      />
      <Option
        id="00031"
        itemType="page"
        label="{{ get_call_off_detail?.value?.code }}"
        screenTargetId="detail"
      />
    </Breadcrumbs>
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
        <Button
          id="button6"
          heightType="auto"
          style={{ map: { label: "danger" } }}
          styleVariant="outline"
          text="Cancel call-off"
        />
        <Text
          id="containerTitle5"
          style={{ map: { color: "primary" } }}
          value="#### {{ get_call_off_detail?.value?.code }}"
          verticalAlign="center"
        />
        <Button
          id="button5"
          heightType="auto"
          iconBefore="line/shipping-transfer-truck"
          text="Ship"
        />
      </View>
    </Container>
  </Header>
  <View id="00030" viewKey="View 1">
    <Container
      id="container9"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle7"
          style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Inter" }}
          value="**Detail**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <KeyValue
          id="keyValue1"
          data="{{ get_call_off_detail.value }}"
          editIcon="bold/interface-edit-pencil"
          enableSaveActions={true}
          groupLayout="singleColumn"
          labelWrap={true}
        >
          <Property
            id="notes"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Notes"
          />
          <Property
            id="created_at"
            editable="false"
            editableOptions={{}}
            format="datetime"
            formatOptions={{}}
            hidden="true"
            label="Created at"
          />
          <Property
            id="updated_at"
            editable="false"
            editableOptions={{}}
            format="datetime"
            formatOptions={{}}
            hidden="true"
            label="Updated at"
          />
          <Property
            id="requested_date"
            editable="false"
            editableOptions={{}}
            format="date"
            formatOptions={{}}
            hidden="false"
            label="Requested date"
          />
          <Property
            id="customer_name"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Customer name"
          />
          <Property
            id="customer_contact"
            editable="false"
            editableOptions={{}}
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            hidden="false"
            label="Contact"
          />
          <Property
            id="created_by_email"
            editable="false"
            editableOptions={{}}
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            hidden="true"
            label="Created by email"
          />
          <Property
            id="units_requested"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="Units requested"
          />
          <Property
            id="active_call_offs"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="false"
            label="Active call-offs"
          />
          <Property
            id="active_artwork_jobs"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="false"
            label="Active artwork-jobs"
          />
          <Property
            id="on_hand_units"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="On-hand"
            valueOverride={'{{ item + " units" }}'}
          />
          <Property
            id="delivery_mode"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Delivery mode"
          />
          <Property
            id="delivery_mode_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Delivery mode label"
          />
          <Property
            id="delivery_charge_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Delivery charge"
          />
          <Property
            id="customer_deadline"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="date"
            formatOptions={{}}
            hidden="false"
            label="Customer deadline"
          />
          <Property
            id="days_to_deadline_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Days to deadline"
          />
          <Property
            id="state"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="State"
          />
          <Property
            id="id"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="ID"
          />
          <Property
            id="code"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Code"
          />
          <Property
            id="customer_id"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="Customer ID"
          />
          <Property
            id="line_count"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="Line count"
          />
          <Property
            id="state_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="State label"
          />
          <Property
            id="state_step"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="State step"
          />
          <Property
            id="state_color"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="State color"
          />
          <Property
            id="is_cancelled"
            editable="false"
            editableOptions={{}}
            format="boolean"
            formatOptions={{}}
            hidden="true"
            label="Is cancelled"
          />
          <Property
            id="is_shipped"
            editable="false"
            editableOptions={{}}
            format="boolean"
            formatOptions={{}}
            hidden="true"
            label="Is shipped"
          />
          <Property
            id="is_terminal"
            editable="false"
            editableOptions={{}}
            format="boolean"
            formatOptions={{}}
            hidden="true"
            label="Is terminal"
          />
          <Property
            id="delivery_charge_amount"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="Delivery charge amount"
          />
          <Property
            id="days_to_deadline"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Days to deadline"
          />
        </KeyValue>
      </View>
    </Container>
    <Steps
      id="steps1"
      horizontalAlign="center"
      indicateCompletedSteps={true}
      itemMode="static"
      value="{{ self.values[0] }}"
    >
      <Option id="00030" value="Open" />
      <Option id="00031" value="Picking" />
      <Option id="00032" value="Shipping" />
      <Option id="b3087" hidden={false} value="Cancelled" />
    </Steps>
    <Container
      id="container10"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle8"
          style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Inter" }}
          value="**Activity**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1" />
    </Container>
    <Container
      id="container8"
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
          id="group6"
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
              id="containerTitle6"
              style={{
                fontSize: "14px",
                fontWeight: "400",
                fontFamily: "Inter",
              }}
              value="**Lines**"
              verticalAlign="center"
            />
            <Text
              id="text2"
              value="Picked **30** of **40** units"
              verticalAlign="center"
            />
            <Text id="text3" value="**85%**" verticalAlign="center" />
            <ProgressBar
              id="progressBar1"
              hideOutput={true}
              label=""
              value={60}
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="table2"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ get_call_off_detail_lines.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          heightType="auto"
          primaryKeyColumnId="64644"
          rowHeight="medium"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="64644"
            alignment="right"
            editable="false"
            format="decimal"
            groupAggregationMode="countDistinct"
            hidden="true"
            key="id"
            label="ID"
            position="center"
            size={32}
            summaryAggregationMode="none"
          />
          <Column
            id="2c906"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="seq"
            placeholder="Enter value"
            position="left"
            size={30}
            summaryAggregationMode="none"
          />
          <Column
            id="c8213"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="p_number"
            label="P number"
            placeholder="Enter value"
            position="center"
            size={78}
            summaryAggregationMode="none"
          />
          <Column
            id="b10fd"
            alignment="left"
            caption="{{ currentSourceRow.product_sub }}"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="artwork_job_code"
            label="Artwork-job"
            placeholder="Enter value"
            position="center"
            size={238}
            summaryAggregationMode="none"
          />
          <Column
            id="07eea"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="product_sub"
            label="Product sub"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="86496"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="tag"
            formatOptions={{ automaticColors: false }}
            groupAggregationMode="none"
            key="rack"
            label="Rack"
            placeholder="Select option"
            position="center"
            size={69}
            summaryAggregationMode="none"
          />
          <Column
            id="cff9d"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="quantity_requested"
            label="Requested"
            placeholder="Enter value"
            position="center"
            size={92}
            summaryAggregationMode="none"
          />
          <Column
            id="bee2d"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="quantity_picked"
            label="Picked"
            placeholder="Enter value"
            position="center"
            size={77}
            summaryAggregationMode="none"
          />
          <Column
            id="48b46"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="picked_cartons_label"
            label="Picked cartons"
            placeholder="Enter value"
            position="center"
            size={183}
            summaryAggregationMode="none"
          />
          <Column
            id="85890"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="progress_pct"
            label="Progress pct"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="ba229"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="progress_label"
            label="Progress label"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="b1ff4"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="notes"
            label="Notes"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="60e45"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            hidden="true"
            key="is_partial"
            label="Is partial"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="bba98"
            alignment="left"
            format="boolean"
            groupAggregationMode="none"
            hidden="true"
            key="is_done"
            label="Is done"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
        </Table>
      </View>
    </Container>
  </View>
</Container>
