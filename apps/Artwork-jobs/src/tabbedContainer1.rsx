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
  >
    <TextInput
      id="textInput2"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder={
        '{{ "Filter " + (_selected_product.value?.customer_name || "") + " artwork-jobs…" }}'
      }
    />
    <Text
      id="text7"
      style={{
        color: "#8d9194",
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
      }}
      value="**Suggested Match**"
      verticalAlign="center"
    />
    <Include src="./container8.rsx" />
    <Text
      id="text13"
      style={{
        color: "#8d9194",
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
      }}
      value="**Other artwork-jobs**"
      verticalAlign="center"
    />
    <ListViewBeta
      id="otherJobsList"
      data="{{ get_artwork_job_candidates.value?.others }}"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Include src="./container9.rsx" />
    </ListViewBeta>
  </View>
  <View
    id="00031"
    icon="line/interface-add-1"
    iconPosition="left"
    viewKey="Create new"
  >
    <TextInput id="nameInput" labelPosition="top" placeholder="Enter value" />
    <Select
      id="categorySelect"
      emptyMessage="No options"
      itemMode="static"
      label="Category"
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
    >
      <Option id="00030" value="Bags" />
      <Option id="00031" value="Boxes" />
      <Option id="00032" value="Others" />
    </Select>
  </View>
</Container>
