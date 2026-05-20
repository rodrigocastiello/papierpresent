<Container
  id="activeLineContainer"
  align="flex-start"
  elevation="raised"
  gap={8}
  hidden="{{ !get_active_line.value }}"
  justify="flex-start"
  layout="column"
  padding={{ left: 12, right: 12, top: 12, bottom: 12 }}
  showBody={true}
  showBorder={true}
  widthGrowFactor={1}
>
  <Text
    id="text2"
    markdown={true}
    size="medium"
    value="# **{{ get_active_line?.value?.product_code }}**"
    weight="normal"
  />
  <Text
    id="text3"
    markdown={true}
    size="medium"
    value="{{ get_active_line.value.meta_line1 }}"
    weight="normal"
  />
  <Text
    id="text14"
    markdown={true}
    size="medium"
    value="{{ get_active_line.value.meta_line2 }}"
    weight="normal"
  />
  <Divider id="divider1" spacing={4} />
  <Text
    id="text4"
    markdown={true}
    size="medium"
    value="**PICK FROM RACK**"
    weight="normal"
  />
  <Container
    id="container1"
    align="center"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 8, right: 8, top: 8, bottom: 8 }}
    showBody={true}
    style={{ map: { background: "#efeff0" } }}
    widthGrowFactor={1}
  >
    <Container
      id="container6"
      align="center"
      cornerType="square"
      gap={8}
      justify="flex-start"
      layout="row"
      padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
      showBody={true}
      widthGrowFactor={1}
    >
      <Icon id="icon3" icon="bold/mail-sign-hashtag" style={{}} widthPx="25" />
      <Text
        id="text13"
        markdown={true}
        size="medium"
        style={{}}
        value="## {{ get_active_line.value.rack_code }}"
        weight="normal"
      />
      <Status
        id="status1"
        _colorByIndex={["#065f46", "#cd6f00", "#dc2626"]}
        _iconByIndex={[
          "bold/interface-validation-check-circle",
          "bold/interface-alert-warning-circle",
          "bold/interface-delete-circle",
        ]}
        _ids={["00030", "00031", "00032"]}
        _labels={["Completed", "Pending", "Canceled"]}
        _values={["completed", "pending", "canceled"]}
        data="[]"
        hidden="{{ !get_active_line.value.location_confirmed }}"
        itemMode="static"
        value="completed"
      />
    </Container>
    <Text
      id="text12"
      markdown={true}
      size="medium"
      style={{}}
      value="{{ get_active_line.value.rack_units }} units · {{ get_active_line.value.is_partial ? 
  '1 partial pallet' : 'full pallet' }}"
      weight="normal"
    />
    <Event
      id="20a06653"
      event="click"
      method="trigger"
      params={{ map: { options: { map: { additionalScope: {} } } } }}
      pluginId="confirm_location"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Container>
  <Text
    id="text7"
    markdown={true}
    size="medium"
    value="{{ get_active_line.value.location_confirmed
       ? '✓ Location confirmed at ' + moment(get_active_line.value.location_confirmed_at).format('HH:mm') + ' · Tap to re-confirm' : 'Tap rack to confirm location' }}"
    weight="normal"
  />
  <Divider id="divider2" spacing={4} />
  <Container
    id="container3"
    align="flex-start"
    cornerType="square"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    showBody={true}
    widthGrowFactor={1}
  >
    <Text
      id="text8"
      markdown={true}
      size="medium"
      value=" Picked units of **{{ get_active_line.value.quantity_requested }}** requested"
      weight="normal"
    />
    <NumberInput
      id="numberInput1"
      customValidation="  {{
    self.value == null || self.value === ''
      ? 'Enter a quantity'
    : self.value < 0  
      ? 'Cannot be negative'
    : self.value > get_active_line.value?.quantity_requested
      ? 'Cannot exceed ' + get_active_line.value?.quantity_requested + ' requested'
    : ''
  }}"
      label=""
      placeholder={0}
      showStepper={true}
      value="{{ _pick_qty.value }}"
    >
      <Event
        id="b5bee62b"
        event="change"
        method="setValue"
        params={{ map: { value: "{{ self.value}}" } }}
        pluginId="_pick_qty"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </NumberInput>
  </Container>
  <Container
    id="container4"
    align="center"
    gap={8}
    justify="flex-start"
    layout="row"
    padding={{ left: 8, right: 8, top: 8, bottom: 8 }}
    showBody={true}
    style={{ map: { background: "#efeff0" } }}
    widthGrowFactor={1}
  >
    <Icon id="icon2" icon="line/shipping-box-2" style={{}} />
    <Text
      id="text9"
      markdown={true}
      size="medium"
      value="**{{ get_active_line.value.breakdown_text }}**"
      weight="normal"
      width="fixed"
    />
    <Container
      id="container5"
      align="flex-start"
      gap={8}
      hidden="{{ !get_active_line?.value?.status_label }}"
      justify="center"
      layout="column"
      padding={{ left: 8, right: 8, top: 4, bottom: 4 }}
      showBody={true}
      style={{
        map: { background: "{{ get_active_line?.value?.status_color_bg }}" },
      }}
      width="fixed"
      widthGrowFactor={1}
    >
      <Text
        id="text10"
        markdown={true}
        size="medium"
        style={{
          map: { text: "{{ get_active_line?.value?.status_color_text }}" },
        }}
        textAlign="center"
        value="{{ get_active_line?.value?.status_label }}"
        weight="normal"
      />
    </Container>
  </Container>
</Container>
