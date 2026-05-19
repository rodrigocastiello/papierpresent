<Screen
  id="create"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={1}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="1a5f785f-93a3-49b9-bcf4-cfd2509b2736"
>
  <Folder id="getters">
    <Function
      id="get_lines"
      funcBody={include("../lib/get_lines.js", "string")}
    />
    <Function
      id="get_products_per_customer"
      funcBody={include("../lib/get_products_per_customer.js", "string")}
    />
  </Folder>
  <Folder id="_states">
    <State id="_lines" value="[]" />
  </Folder>
  <Folder id="setters">
    <JavascriptQuery
      id="add_line"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/add_line.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="remove_line"
      _additionalScope={["rowId"]}
      notificationDuration={4.5}
      query={include("../lib/remove_line.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="go_to_list_page"
      notificationDuration={4.5}
      query={include("../lib/go_to_list_page.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="save_lines"
      _additionalScope={["changes"]}
      notificationDuration={4.5}
      query={include("../lib/save_lines.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="line_business_rules"
      _additionalScope={["changes"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/line_business_rules.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="validate_call_off"
      query={include("../lib/validate_call_off.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="create_call_off"
      query={include("../lib/create_call_off.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="_requests">
    <SqlQueryUnified
      id="_GET_products"
      notificationDuration={4.5}
      query={include("../lib/_GET_products.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_CREATE_call_off"
      _additionalScope={["payload"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/_CREATE_call_off.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="_init">
    <JavascriptQuery
      id="_init_create"
      notificationDuration={4.5}
      query={include("../lib/_init_create.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Frame
    id="$main2"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="container3"
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
            label="Call-offs"
            screenTargetId="list"
          />
          <Option
            id="00031"
            itemType="page"
            label="New"
            screenTargetId="create"
          />
        </Breadcrumbs>
        <Container
          id="group4"
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
              id="button3"
              heightType="auto"
              style={{}}
              styleVariant="outline"
              text="Cancel"
            >
              <Event
                id="47b052ad"
                event="click"
                method="trigger"
                params={{}}
                pluginId="go_to_list_page"
                type="datasource"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
            <Text
              id="containerTitle2"
              style={{ map: { color: "primary" } }}
              value="#### Create call-off"
              verticalAlign="center"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Form
          id="calloffForm"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          requireValidation={true}
          showBody={true}
          showBorder={false}
          showFooter={true}
          style={{ background: "canvas", footerBackground: "surfacePrimary" }}
        >
          <Header>
            <Text
              id="formTitle1"
              value="#### Form title"
              verticalAlign="center"
            />
          </Header>
          <Body>
            <Include src="./container4.rsx" />
            <Container
              id="container5"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              padding="12px"
              showBody={true}
              showHeader={true}
            >
              <Header>
                <Container
                  id="group3"
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
                      id="containerTitle4"
                      style={{
                        fontSize: "13px",
                        fontWeight: "400",
                        fontFamily: "Inter",
                      }}
                      value="**Lines**"
                      verticalAlign="center"
                    />
                    <Button
                      id="button4"
                      disabled="{{ !customerSelect?.value }}"
                      heightType="fill"
                      iconBefore="line/interface-add-1"
                      text="Add line"
                    >
                      <Event
                        id="cefacfab"
                        event="click"
                        method="trigger"
                        params={{}}
                        pluginId="add_line"
                        type="datasource"
                        waitMs="0"
                        waitType="debounce"
                      />
                    </Button>
                  </View>
                </Container>
              </Header>
              <View id="00030" viewKey="View 1">
                <Table
                  id="linesTable"
                  actionsOverflowPosition={1}
                  cellSelection="none"
                  clearChangesetOnSave={true}
                  data="{{ get_lines.value }}"
                  defaultSelectedRow={{
                    mode: "index",
                    indexType: "display",
                    index: 0,
                  }}
                  emptyMessage="No rows found"
                  margin="0"
                  primaryKeyColumnId="e5600"
                  rowHeight="medium"
                  showBorder={true}
                  showHeader={true}
                  toolbarPosition="bottom"
                >
                  <Column
                    id="e5600"
                    alignment="left"
                    editable={false}
                    editableOptions={{ spellCheck: false }}
                    format="string"
                    formatOptions={{ notation: "standard" }}
                    groupAggregationMode="countDistinct"
                    hidden="true"
                    key="id"
                    label="ID"
                    placeholder="Enter value"
                    position="center"
                    size={263.65625}
                    summaryAggregationMode="none"
                  />
                  <Column
                    id="3d952"
                    alignment="left"
                    editable="true"
                    editableOptions={{ spellCheck: false }}
                    format="tag"
                    formatOptions={{ automaticColors: false }}
                    groupAggregationMode="none"
                    key="product_id"
                    label="Product"
                    optionList={{
                      mode: "mapped",
                      mappedData: "{{ get_products_per_customer.value }}",
                      valueByIndex: "{{ item.product_id }}",
                      labelByIndex: "{{ item.label }}",
                      fallbackTextByIndex: "",
                      iconByIndex: "",
                      hiddenByIndex: "",
                      manualData: [
                        { map: { value: "Option 1" } },
                        { map: { value: "Option 2" } },
                        { map: { value: "Option 3" } },
                      ],
                    }}
                    placeholder="Select option"
                    position="center"
                    size={321.6875}
                    summaryAggregationMode="none"
                  />
                  <Column
                    id="3a5b7"
                    alignment="left"
                    editableOptions={{ spellCheck: false }}
                    format="string"
                    groupAggregationMode="none"
                    hidden="true"
                    key="artwork_job_id"
                    label="Artwork job ID"
                    placeholder="Enter value"
                    position="center"
                    size={97.03125}
                    summaryAggregationMode="none"
                  />
                  <Column
                    id="a524a"
                    alignment="right"
                    editable="true"
                    editableOptions={{ showStepper: true, min: "1" }}
                    format="decimal"
                    formatOptions={{
                      showSeparators: true,
                      notation: "standard",
                    }}
                    groupAggregationMode="sum"
                    key="quantity_requested"
                    label="Requested"
                    placeholder="Enter value"
                    position="center"
                    size={85.875}
                    summaryAggregationMode="none"
                  />
                  <Column
                    id="0824c"
                    alignment="left"
                    editableOptions={{ spellCheck: false }}
                    format="string"
                    groupAggregationMode="none"
                    label="Available Stock"
                    placeholder="Enter value"
                    position="center"
                    referenceId="availableStock"
                    size={110.4375}
                    summaryAggregationMode="none"
                    valueOverride="{{ currentSourceRow.product_id ? (formatDataAsArray(_GET_products.data).find(p => p.product_id ===
  currentSourceRow.product_id) || {}).available ?? '—' : '—' }}"
                  />
                  <Action id="13bed" icon="line/interface-remove-1">
                    <Event
                      id="e725f4dc"
                      event="clickAction"
                      method="trigger"
                      params={{
                        map: {
                          options: {
                            map: {
                              additionalScope: {
                                map: { rowId: "{{ currentRow?.id }}" },
                              },
                            },
                          },
                        },
                      }}
                      pluginId="remove_line"
                      type="datasource"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </Action>
                  <Event
                    id="9d4a427d"
                    event="changeCell"
                    method="trigger"
                    params={{
                      map: {
                        options: {
                          onSuccess: null,
                          onFailure: null,
                          additionalScope: {
                            map: {
                              changes: "{{ linesTable?.changesetArray }}",
                            },
                          },
                        },
                      },
                    }}
                    pluginId="save_lines"
                    type="datasource"
                    waitMs="0"
                    waitType="debounce"
                  />
                </Table>
              </View>
            </Container>
          </Body>
          <Footer>
            <Container
              id="group2"
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
                  id="formButton1"
                  heightType="auto"
                  iconBefore="line/computer-storage-floppy-disk"
                  submit={true}
                  submitTargetId="calloffForm"
                  text="Save call-off"
                />
              </View>
            </Container>
          </Footer>
          <Event
            id="6fbc84f0"
            event="submit"
            method="trigger"
            params={{}}
            pluginId="create_call_off"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Form>
      </View>
    </Container>
  </Frame>
</Screen>
