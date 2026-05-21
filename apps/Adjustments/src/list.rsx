<Screen
  id="list"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="List"
  urlSlug="list"
  uuid="80dc90bf-b8f7-4fdd-8189-082061646967"
>
  <Folder id="_init">
    <JavascriptQuery
      id="_init_list"
      notificationDuration={4.5}
      query={include("../lib/_init_list.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="setters">
    <JavascriptQuery
      id="open_create_page"
      notificationDuration={4.5}
      query={include("../lib/open_create_page.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="_requests">
    <SqlQueryUnified
      id="_GET_adjustments"
      isMultiplayerEdited={false}
      query={include("../lib/_GET_adjustments.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="getters">
    <Function
      id="get_adjustments"
      funcBody={include("../lib/get_adjustments.js", "string")}
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
    >
      <Header>
        <Text
          id="containerTitle1"
          value="#### Adjustments"
          verticalAlign="center"
        />
        <Button id="button1" text="New adjustment">
          <Event
            id="b6013de3"
            event="click"
            method="trigger"
            params={{}}
            pluginId="open_create_page"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </Header>
      <View id="00030" viewKey="View 1">
        <Table
          id="table1"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ get_adjustments.value }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="No rows found"
          enableSaveActions={true}
          primaryKeyColumnId="8480e"
          rowHeight="small"
          showBorder={true}
          showFooter={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="8480e"
            alignment="left"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            hidden="true"
            key="adjustment_id"
            label="Adjustment ID"
            placeholder="Enter value"
            position="center"
            size={259.96875}
            summaryAggregationMode="none"
          />
          <Column
            id="a117f"
            alignment="left"
            format="datetime"
            groupAggregationMode="none"
            key="created_at"
            label="Created at"
            placeholder="Enter value"
            position="center"
            size={142.875}
            summaryAggregationMode="none"
          />
          <Column
            id="60e60"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="delta"
            label="Delta"
            placeholder="Enter value"
            position="center"
            size={69.59375}
            summaryAggregationMode="none"
          />
          <Column
            id="8fe7a"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="on_hand_before"
            label="On hand before"
            placeholder="Enter value"
            position="center"
            size={104.140625}
            summaryAggregationMode="none"
          />
          <Column
            id="7380c"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="on_hand_after"
            label="On hand after"
            placeholder="Enter value"
            position="center"
            size={94.078125}
            summaryAggregationMode="none"
          />
          <Column
            id="79c37"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="reason_code"
            label="Reason code"
            placeholder="Enter value"
            position="center"
            size={121.75}
            summaryAggregationMode="none"
          />
          <Column
            id="36cad"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="reason_detail"
            label="Reason detail"
            placeholder="Enter value"
            position="center"
            size={92.453125}
            summaryAggregationMode="none"
          />
          <Column
            id="bf725"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="customer_id"
            label="Customer ID"
            placeholder="Enter value"
            position="center"
            size={86.484375}
            summaryAggregationMode="none"
          />
          <Column
            id="49323"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="customer_name"
            label="Customer name"
            placeholder="Enter value"
            position="center"
            size={113.1875}
            summaryAggregationMode="none"
          />
          <Column
            id="70d93"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="artwork_job_id"
            label="Artwork job ID"
            placeholder="Enter value"
            position="center"
            size={97.03125}
            summaryAggregationMode="none"
          />
          <Column
            id="43f17"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="artwork_job_code"
            label="Artwork job code"
            placeholder="Enter value"
            position="center"
            size={113.53125}
            summaryAggregationMode="none"
          />
          <Column
            id="95f78"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="artwork_job_name"
            label="Artwork job name"
            placeholder="Enter value"
            position="center"
            size={116.453125}
            summaryAggregationMode="none"
          />
          <Column
            id="cb47a"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="product_id"
            label="Product ID"
            placeholder="Enter value"
            position="center"
            size={75.6875}
            summaryAggregationMode="none"
          />
          <Column
            id="c0084"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="p_number"
            label="P number"
            placeholder="Enter value"
            position="center"
            size={70.328125}
            summaryAggregationMode="none"
          />
          <Column
            id="0dbe7"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="product_size"
            label="Product size"
            placeholder="Enter value"
            position="center"
            size={93.640625}
            summaryAggregationMode="none"
          />
          <Column
            id="b04c6"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="location_id"
            label="Location ID"
            placeholder="Enter value"
            position="center"
            size={79.9375}
            summaryAggregationMode="none"
          />
          <Column
            id="9ee20"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="rack_code"
            label="Rack code"
            placeholder="Enter value"
            position="center"
            size={75.328125}
            summaryAggregationMode="none"
          />
          <Column
            id="432a7"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="zone"
            label="Zone"
            placeholder="Enter value"
            position="center"
            size={44.671875}
            summaryAggregationMode="none"
          />
          <Column
            id="25684"
            alignment="right"
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            key="actor_id"
            label="Actor ID"
            placeholder="Enter value"
            position="center"
            size={61.90625}
            summaryAggregationMode="none"
          />
          <Column
            id="ba91c"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover" }}
            groupAggregationMode="none"
            key="actor_email"
            label="Actor email"
            position="center"
            size={216.625}
            summaryAggregationMode="none"
          >
            <Event
              id="554cbccb"
              event="clickCell"
              method="openUrl"
              params={{ map: { url: "mailto:{{ item }}" } }}
              pluginId=""
              type="util"
              waitMs="0"
              waitType="debounce"
            />
          </Column>
          <Column
            id="e4b44"
            alignment="left"
            editableOptions={{ spellCheck: false }}
            format="string"
            groupAggregationMode="none"
            key="actor_name"
            label="Actor name"
            placeholder="Enter value"
            position="center"
            size={112.1875}
            summaryAggregationMode="none"
          />
        </Table>
      </View>
    </Container>
  </Frame>
</Screen>
