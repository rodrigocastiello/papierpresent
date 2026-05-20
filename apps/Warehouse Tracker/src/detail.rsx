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
  title="{{ get_selected_call_off.value?.code }} · {{ get_selected_call_off.value?.customer_name }}"
  urlSlug={null}
  uuid="fe7cb60e-4a9c-465d-9a80-564be8cfb572"
>
  <Container
    id="linesContainer"
    align="flex-start"
    elevation="raised"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 8, bottom: 8 }}
    showBody={true}
    showBorder={true}
    widthGrowFactor={1}
  >
    <Text
      id="text1"
      markdown={true}
      size="medium"
      style={{ map: { text: "rgba(154, 152, 152, 1)" } }}
      textAlign="center"
      value="**{{ get_selected_call_off.value.line_count }} line{{ get_selected_call_off.value.line_count > 1 ? 's' : '' }}**"
      weight="normal"
    />
    <CollectionView
      id="linesListCollection"
      bodyByIndex=""
      data="{{ get_call_off_lines.value }}"
      prefixIconByIndex="{{ item.icon }}"
      prefixIconColorByIndex="{{ item.color }}"
      prefixImageFitByIndex="cover"
      prefixImageShapeByIndex="square"
      prefixImageSizeByIndex="1 to 1"
      prefixImageSourceByIndex=""
      prefixTypeByIndex="icon"
      showSeparator={true}
      subtitleByIndex="{{ item.subtitle }}"
      subtitleLengthByIndex="3"
      suffixIconByIndex=""
      suffixTextByIndex="{{ item.rack_code || '—' }}"
      suffixTypeByIndex="text+icon"
      suffixValueByIndex="false"
      titleByIndex="{{ item.product_code }}"
    >
      <Event
        id="cef52cef"
        event="press"
        method="trigger"
        params={{
          map: {
            options: {
              onSuccess: null,
              onFailure: null,
              additionalScope: {
                active_line_id: "{{ item.id }}",
                pick_qty: "{{ item.quantity_picked || 0 }}",
              },
            },
          },
        }}
        pluginId="select_line"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </CollectionView>
  </Container>
  <Include src="./activeLineContainer.rsx" />
  <Button
    id="button1"
    disabled="{{ !_active_line_id.value || _pick_qty.value === get_active_line.value?.quantity_picked }}"
    hidden="{{ !_active_line_id.value }}"
    loading="{{ pick_line.isFetching || _PICK_line.isFetching }}"
    size="small"
    style={{ map: { background: "#d87706" } }}
    text="Confirm pick"
  >
    <Event
      id="e413c1bc"
      event="click"
      method="trigger"
      params={{
        map: {
          options: {
            map: {
              additionalScope: {
                line_id: "{{ _active_line_id.value }}",
                new_quantity_picked: "{{ _pick_qty.value }}",
              },
            },
          },
        },
      }}
      pluginId="pick_line"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Screen>
