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
    <Text
      id="containerTitle5"
      style={{ map: { color: "primary" } }}
      value="#### {{ get_call_off_detail?.value?.code }}"
      verticalAlign="center"
    />
    <Container
      id="group7"
      _align="center"
      _gap="0px"
      _justify="end"
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
          disabled="{{ get_call_off_detail.value?.is_terminal }}"
          heightType="auto"
          loading="{{ _UPDATE_call_off_state.isFetching }}"
          style={{ map: { label: "danger" } }}
          styleVariant="outline"
          text="Cancel call-off"
        >
          <Event
            id="53710b53"
            event="click"
            method="trigger"
            params={{}}
            pluginId="cancel_call_off"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="button5"
          disabled="{{ get_call_off_detail.value?.is_terminal || !get_call_off_progress.value?.is_complete }}"
          heightType="auto"
          iconBefore="line/shipping-transfer-truck"
          loading="{{ _UPDATE_call_off_state.isFetching }}"
          text="Ship"
        >
          <Event
            id="610d2f6e"
            event="click"
            method="trigger"
            params={{}}
            pluginId="ship_call_off"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <Text
      id="text4"
      style={{ map: { color: "#9ca3af" } }}
      value={
        'requested {{ moment(get_call_off_detail.value?.requested_date).format("MMM D, YYYY") }}'
      }
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Steps
      id="steps1"
      horizontalAlign="center"
      indicateCompletedSteps={true}
      itemMode="static"
      value="{{ get_call_off_detail.value?.state }}"
    >
      <Option id="00030" label="Open" value="open" />
      <Option id="00031" label="Picking" value="picking" />
      <Option id="00032" label="Shipped" value="shipped" />
      <Option id="b3087" hidden={false} label="Cancelled" value="cancelled" />
    </Steps>
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
          value="**Customer**"
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
            hidden="true"
            label="Requested date"
          />
          <Property
            id="customer_name"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Name"
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
            hidden="true"
            label="Delivery mode label"
          />
          <Property
            id="delivery_charge_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Delivery charge"
          />
          <Property
            id="customer_deadline"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="date"
            formatOptions={{}}
            hidden="true"
            label="Customer deadline"
          />
          <Property
            id="days_to_deadline_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
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
    <Container
      id="container12"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle10"
          style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Inter" }}
          value="**Delivery**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <KeyValue
          id="keyValue2"
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
            hidden="true"
            label="Requested date"
          />
          <Property
            id="customer_name"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="true"
            label="Customer name"
          />
          <Property
            id="customer_contact"
            editable="false"
            editableOptions={{}}
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            hidden="true"
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
            hidden="true"
            label="Active call-offs"
          />
          <Property
            id="active_artwork_jobs"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            hidden="true"
            label="Active artwork-jobs"
          />
          <Property
            id="on_hand_units"
            editable="false"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{}}
            hidden="true"
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
            label="Mode"
          />
          <Property
            id="delivery_charge_label"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Charge"
          />
          <Property
            id="customer_deadline"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="date"
            formatOptions={{}}
            hidden="false"
            label="Deadline"
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
              value="{{ get_call_off_progress?.value?.label }}"
              verticalAlign="center"
            />
            <Text
              id="text3"
              value="**%{{ get_call_off_progress?.value?.pct }}**"
              verticalAlign="center"
            />
            <ProgressBar
              id="progressBar1"
              hideOutput={true}
              label=""
              value="{{ get_call_off_progress.value.pct }}"
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
          primaryKeyColumnId="3d9ee"
          rowHeight="medium"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="3d9ee"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="id"
            label="ID"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
          <Column
            id="8d51a"
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
            id="001f4"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="p_number"
            label="P number"
            placeholder="Enter value"
            position="center"
            size={83}
            summaryAggregationMode="none"
          />
          <Column
            id="a5e5f"
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
            id="319e6"
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
            id="c573f"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="tag"
            formatOptions={{ automaticColors: false }}
            groupAggregationMode="none"
            key="rack"
            label="Rack"
            placeholder="Select option"
            position="center"
            size={64}
            summaryAggregationMode="none"
          />
          <Column
            id="9e2e8"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="quantity_requested"
            label="Requested"
            placeholder="Enter value"
            position="center"
            size={83}
            summaryAggregationMode="none"
          />
          <Column
            id="ad0da"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="quantity_picked"
            label="Picked"
            placeholder="Enter value"
            position="center"
            size={65}
            summaryAggregationMode="none"
          />
          <Column
            id="87904"
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
            id="02418"
            alignment="left"
            format="tag"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            hidden="true"
            key="progress_label"
            label="Progress label"
            placeholder="Select option"
            position="center"
            size={100}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="1efa6"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{ automaticColors: true }}
            groupAggregationMode="none"
            key="picked_cartons_label"
            label="Picked cartons"
            placeholder="Enter value"
            position="center"
            size={208}
            summaryAggregationMode="none"
            valueOverride="{{ _.startCase(item) }}"
          />
          <Column
            id="f284c"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="notes"
            label="Notes"
            placeholder="Enter value"
            position="center"
            size={163}
            summaryAggregationMode="none"
          />
          <Column
            id="905ec"
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
            id="836dc"
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
