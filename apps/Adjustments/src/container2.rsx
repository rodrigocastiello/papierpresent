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
      value="#### Record stock adjustment"
      verticalAlign="center"
    />
    <Button id="button2" style={{}} styleVariant="outline" text="Cancel" />
    <Text
      id="text1"
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
        <Alert2 id="alert1" value="warning">
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
              data="{
  id: 0,
  firstName: 'Chic',
  lastName: 'Footitt',
  email: 'chic.footitt@yahoo.com',
  website: 'https://chic.footitt.com',
  text: 'Nulla sit amet nibh at augue facilisis viverra quis id dui. Nullam mattis ultricies metus. Donec eros lorem, egestas vitae aliquam quis, rutrum a mauris',
  role: 'Viewer',
  teams: ['Workplace', 'Infrastructure'],
  enabled: true,
  createdAt: '2023-01-16T23:40:20.385Z',
}"
              editIcon="bold/interface-edit-pencil"
              enableSaveActions={true}
              groupLayout="singleColumn"
              labelWrap={true}
              style={{}}
            />
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
              value={0}
            />
            <NumberInput
              id="numberInput2"
              currency="USD"
              inputValue={0}
              label="Adjustment quantity"
              labelPosition="top"
              placeholder="Enter value"
              preventScroll={true}
              required={true}
              showSeparators={true}
              showStepper={true}
              style={{}}
              value={0}
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
              <Option id="00030" value="Option 1" />
              <Option id="00031" value="Option 2" />
              <Option id="00032" value="Option 3" />
            </Select>
            <TextArea
              id="textArea1"
              autoResize={true}
              label="Reason detail"
              labelPosition="top"
              minLines={2}
              placeholder="Enter value"
              required={true}
            />
          </View>
        </Container>
      </Body>
      <Footer>
        <Button
          id="formButton1"
          submit={true}
          submitTargetId="form1"
          text="Submit adjustment"
        />
      </Footer>
    </Form>
  </View>
</Container>
