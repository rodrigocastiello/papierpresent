<DrawerFrame
  id="drawerFrame1"
  enableFullBleed={true}
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text
      id="drawerTitle1"
      style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Inter" }}
      value="**Link product to artwork-job**"
      verticalAlign="center"
    />
    <Button
      id="drawerCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        id="b3dec680"
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="drawerFrame1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text3"
      style={{
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
        color: "#8d9194",
      }}
      value="Connect a new Oddo P-number to an existing or new artwork-job."
      verticalAlign="center"
    />
  </Header>
  <Body>
    <Container
      id="container7"
      enableFullBleed={true}
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showHeader={true}
      style={{ map: { headerBackground: "canvas" } }}
    >
      <Header>
        <Text
          id="containerTitle6"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="tabbedContainer1"
          currentViewKey="{{ self.viewKeys[0] }}"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showHeader={true}
        >
          <Header>
            <Tabs
              id="tabs1"
              itemMode="static"
              navigateContainer={true}
              style={{}}
              styleVariant="lineBottom"
              targetContainerId="tabbedContainer1"
              value="{{ self.values[0] }}"
            >
              <Option id="00030" value="Tab 1" />
              <Option id="00031" value="Tab 2" />
              <Option id="00032" value="Tab 3" />
            </Tabs>
          </Header>
          <View
            id="00030"
            icon="line/interface-link"
            iconPosition="left"
            viewKey="Link to existing"
          />
          <View
            id="00031"
            icon="line/interface-add-1"
            iconPosition="left"
            viewKey="Create new"
          />
        </Container>
      </View>
    </Container>
  </Body>
</DrawerFrame>
