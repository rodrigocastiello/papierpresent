<Container
  id="container2"
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
    <Breadcrumbs
      id="breadcrumbs1"
      itemMode="static"
      style={{ map: { currentPageText: "primary" } }}
      value="{{ retoolContext.appUuid }}"
    >
      <Option
        id="00030"
        itemType="page"
        label="Adjustments"
        screenTargetId="list"
      />
      <Option id="00031" itemType="page" label="New" screenTargetId="create" />
    </Breadcrumbs>
    <Text
      id="containerTitle2"
      style={{ map: { color: "primary" } }}
      value="#### Record stock adjustment"
      verticalAlign="center"
    />
    <Button id="button2" style={{}} styleVariant="outline" text="Cancel">
      <Event
        id="45d71d65"
        event="click"
        method="trigger"
        params={{}}
        pluginId="open_list_page"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text1"
      style={{ map: { color: "#8d9194" } }}
      value="Correct on-hand to match physical reality. Adjustments are permanent and audited."
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Form
      id="form1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
      style={{ background: "canvas", footerBackground: "surfacePrimary" }}
    >
      <Header>
        <Text id="formTitle1" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Include src="./container3.rsx" />
        <Container
          id="container9"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Text
              id="containerTitle9"
              style={{
                fontSize: "14px",
                fontWeight: "400",
                fontFamily: "Inter",
              }}
              value="**Audit-row preview**"
              verticalAlign="center"
            />
          </Header>
          <View id="00030" viewKey="View 1">
            <KeyValue
              id="keyValue1"
              data="{{ get_audit_preview.value }}"
              editIcon="bold/interface-edit-pencil"
              enableSaveActions={true}
              groupLayout="singleColumn"
              labelWrap={true}
              style={{}}
            >
              <Property
                id="id"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="ID"
              />
              <Property
                id="created_at"
                editable="false"
                editableOptions={{}}
                format="datetime"
                formatOptions={{}}
                hidden="false"
                label="Created at"
              />
              <Property
                id="actor"
                editable="false"
                editableOptions={{}}
                format="link"
                formatOptions={{ showUnderline: "hover" }}
                hidden="false"
                label="Actor"
              />
              <Property
                id="customer"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="Customer"
              />
              <Property
                id="artwork_job"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="Artwork job"
              />
              <Property
                id="p_number"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="P number"
              />
              <Property
                id="rack"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="Rack"
              />
              <Property
                id="on_hand_before"
                editable="false"
                editableOptions={{ showStepper: true }}
                format="decimal"
                formatOptions={{ showSeparators: true, notation: "standard" }}
                hidden="false"
                label="On hand before"
              />
              <Property
                id="delta"
                editable="false"
                editableOptions={{ showStepper: true }}
                format="decimal"
                formatOptions={{ showSeparators: true, notation: "standard" }}
                hidden="false"
                label="Delta"
              />
              <Property
                id="on_hand_after"
                editable="false"
                editableOptions={{ showStepper: true }}
                format="decimal"
                formatOptions={{ showSeparators: true, notation: "standard" }}
                hidden="false"
                label="On hand after"
              />
              <Property
                id="reason_code"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="Reason code"
              />
              <Property
                id="reason_detail"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="Reason detail"
              />
              <Property
                id="reversible_by"
                editable="false"
                editableOptions={{ spellCheck: false }}
                format="string"
                formatOptions={{}}
                hidden="false"
                label="Reversible by"
              />
            </KeyValue>
          </View>
        </Container>
        <Container
          id="container7"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Text
              id="containerTitle7"
              style={{
                fontSize: "14px",
                fontWeight: "400",
                fontFamily: "Inter",
              }}
              value="**Adjustment**"
              verticalAlign="center"
            />
          </Header>
          <View id="00030" viewKey="View 1">
            <NumberInput
              id="numberInput1"
              currency="USD"
              inputValue={0}
              label="Current on-hand"
              labelPosition="top"
              placeholder="Enter value"
              readOnly="true"
              showSeparators={true}
              showStepper={true}
              style={{ map: { background: "canvas" } }}
              value="{{ get_current_on_hand.value }}"
            />
            <NumberInput
              id="numberInput2"
              currency="USD"
              inputValue={0}
              label="Adjustment quantity"
              labelPosition="top"
              min="{{ -1 * (get_current_on_hand.value || 0) }}"
              placeholder="Enter value"
              preventScroll={true}
              required={true}
              showSeparators={true}
              showStepper={true}
              style={{}}
              value={0}
            />
            <Text
              id="text3"
              heightType="fixed"
              horizontalAlign="center"
              style={{
                background:
                  '{{ numberInput2.value < 0 ? "#fee2e2" : numberInput2.value > 0 ? "#dcfce7" : "transparent" }}',
                fontSize: "14px",
                fontWeight: "400",
                fontFamily: "Inter",
              }}
              value={
                '{{ "**" + Number(get_new_on_hand.value).toLocaleString() + "** units  ←  " + (numberInput2.value > 0 ? "+" : "") +\n  numberInput2.value + " u" }}'
              }
              verticalAlign="center"
            />
          </View>
        </Container>
        <Container
          id="container8"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Text
              id="containerTitle8"
              style={{
                fontSize: "14px",
                fontWeight: "400",
                fontFamily: "Inter",
              }}
              value="**Reason**"
              verticalAlign="center"
            />
          </Header>
          <View id="00030" viewKey="View 1">
            <Select
              id="select5"
              emptyMessage="No options"
              itemMode="static"
              label="Reason code"
              labelPosition="top"
              overlayMaxHeight={375}
              placeholder="Select an option"
              required={true}
              showSelectionIndicator={true}
            >
              <Option id="00030" label="Damage" value="damage" />
              <Option
                id="00031"
                label="Count discrepancy"
                value="count_discrepancy"
              />
              <Option
                id="00032"
                label="Customer return"
                value="customer_return"
              />
              <Option
                id="97e63"
                disabled={false}
                hidden={false}
                label="Supplier short"
                value="supplier_short"
              />
              <Option
                id="17af5"
                disabled={false}
                hidden={false}
                label="Supplier over"
                value="supplier_over"
              />
              <Option
                id="fa140"
                disabled={false}
                hidden={false}
                label="Internal correction"
                value="internal_correction"
              />
              <Option
                id="5e4a6"
                disabled={false}
                hidden={false}
                label="Other"
                value="other"
              />
            </Select>
            <TextArea
              id="textArea1"
              autoResize={true}
              label="Reason detail"
              labelPosition="top"
              minLines="3"
              placeholder="Enter value"
              required={true}
            />
            <Text
              id="text4"
              style={{
                fontSize: "10px",
                fontWeight: "400",
                fontFamily: "Inter",
                color: "#8d9194",
              }}
              value="Describe what happened. This is stored on the audit log and surfaced when someone investigates the variance."
              verticalAlign="center"
            />
          </View>
        </Container>
        <Alert2 id="alert1" style={{}} value="warning">
          <State
            id="0"
            actionIconPositions="right"
            actionPositions="bottom"
            actionTexts="Action"
            actionTooltips={null}
            backgroundColors={null}
            borderColors={null}
            colors={null}
            descriptions="Description"
            iconPositions="center"
            icons="bold/interface-alert-information-circle"
            styleVariants="info"
            titles="Info"
            tooltips={null}
            values="info"
          />
          <State
            id="1"
            actionIconPositions="right"
            actionPositions="bottom"
            actionTexts="Action"
            actionTooltips={null}
            backgroundColors={null}
            borderColors={null}
            colors={null}
            descriptions="Description"
            iconPositions="center"
            icons="bold/interface-validation-check-circle"
            styleVariants="success"
            titles="Success"
            tooltips={null}
            values="success"
          />
          <State
            id="2"
            actionIconPositions="right"
            actionPositions="bottom"
            actionTooltips={null}
            backgroundColors={null}
            borderColors={null}
            colors={null}
            descriptions="They cannot be undone, only reversed by a new adjustment in the opposite direction."
            iconPositions="center"
            icons="bold/interface-alert-warning-triangle"
            styleVariants="warning"
            titles="Adjustments write a permanent audit row"
            tooltips={null}
            values="warning"
          />
          <State
            id="3"
            actionIconPositions="right"
            actionPositions="bottom"
            actionTexts="Action"
            actionTooltips={null}
            backgroundColors={null}
            borderColors={null}
            colors={null}
            descriptions="Description"
            iconPositions="center"
            icons="bold/interface-delete-circle"
            styleVariants="error"
            titles="Error"
            tooltips={null}
            values="error"
          />
        </Alert2>
      </Body>
      <Footer>
        <Button
          id="formButton1"
          disabled={
            '  {{ !select1.value || !select2.value || !select3.value || !select4.value || !numberInput2.value || numberInput2.value === 0 || !select5.value || !((textArea1.value || "").trim()) }}'
          }
          submit={true}
          submitTargetId="form1"
          text="Submit adjustment"
        />
      </Footer>
      <Event
        id="d1bb7b6e"
        event="submit"
        method="trigger"
        params={{}}
        pluginId="create_adjustment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
</Container>
