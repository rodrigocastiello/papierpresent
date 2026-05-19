<Screen
  id="list"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="List"
  urlSlug=""
  uuid="09d2b762-ae3b-47a7-862b-e929444d6618"
>
  <Folder id="getters">
    <Function
      id="get_all_customers"
      funcBody={include("../lib/get_all_customers.js", "string")}
    />
    <Function
      id="get_call_offs"
      funcBody={include("../lib/get_call_offs.js", "string")}
    />
  </Folder>
  <Folder id="setters">
    <JavascriptQuery
      id="go_to_create_page"
      notificationDuration={4.5}
      query={include("../lib/go_to_create_page.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Frame
    id="$main"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
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
      style={{ background: "#f6f6f6", headerBackground: "surfacePrimary" }}
    >
      <Header>
        <Spacer id="spacer1" />
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
              value="#### Call-offs"
              verticalAlign="center"
            />
            <Button
              id="button1"
              heightType="auto"
              iconBefore="line/interface-download-button-2"
              style={{}}
              styleVariant="outline"
              text="Export"
            />
            <Button
              id="button2"
              heightType="auto"
              iconBefore="line/interface-add-1"
              text="Create call-off"
            >
              <Event
                id="9daed226"
                event="click"
                method="trigger"
                params={{}}
                pluginId="go_to_create_page"
                type="datasource"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
          </View>
        </Container>
        <Spacer id="spacer2" />
      </Header>
      <View id="00030" viewKey="View 1">
        <Include src="./container2.rsx" />
      </View>
    </Container>
  </Frame>
</Screen>
