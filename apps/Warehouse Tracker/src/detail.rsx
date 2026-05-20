<Screen
  id="detail"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={2}
  _searchParams={[]}
  browserTitle={null}
  headerLeftActions={[
    {
      type: "icon",
      value: "line/interface-arrows-left",
      event: {
        id: "52325da1",
        event: "click",
        method: "trigger",
        pluginId: "open_list_screen",
        type: "datasource",
        waitMs: 0,
        waitType: "debounce",
      },
    },
  ]}
  headerRightActions={[
    {
      type: "icon",
      value: "bold/interface-setting-menu-vertical",
      event: {
        id: "6a2a0944",
        event: "click",
        method: "trigger",
        pluginId: "",
        type: "datasource",
        waitMs: 0,
        waitType: "debounce",
      },
    },
  ]}
  title="{{ get_selected_call_off?.value.code }}"
  urlSlug={null}
  uuid="fe7cb60e-4a9c-465d-9a80-564be8cfb572"
>
  <Container
    id="container1"
    align="flex-start"
    elevation="raised"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    showBody={true}
    showBorder={true}
    widthGrowFactor={1}
  >
    <CollectionView
      id="listCollection2"
      bodyByIndex=""
      data="{{ get_selected_call_off.value.lines }}"
      prefixIconByIndex="bold/interface-validation-check-circle"
      prefixIconColorByIndex="green"
      prefixImageFitByIndex="cover"
      prefixImageShapeByIndex="square"
      prefixImageSizeByIndex="1 to 1"
      prefixImageSourceByIndex=""
      prefixTypeByIndex="icon"
      showSeparator={true}
      subtitleByIndex="{{ item. }}"
      subtitleLengthByIndex="2"
      suffixIconByIndex="bold/interface-arrows-button-right"
      suffixTextByIndex="Button"
      suffixTypeByIndex="none"
      suffixValueByIndex="false"
      titleByIndex="{{ item.name }}"
    />
  </Container>
</Screen>
