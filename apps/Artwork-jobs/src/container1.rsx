<Container
  id="container1"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
  style={{ background: "canvas", headerBackground: "surfacePrimary" }}
>
  <Header>
    <Text
      id="containerTitle1"
      style={{ map: { color: "primary" } }}
      value="#### Artwork-jobs"
      verticalAlign="center"
    />
    <Text
      id="text4"
      style={{
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
        color: "#8d9194",
      }}
      value={
        '{{ (_GET_artwork_jobs_stats?.data?.unlinked_count[0] ?? 0) + " unlinked Odoo products · " +\n  (_GET_artwork_jobs_stats?.data?.active_count[0] ?? 0) + " active artwork-jobs" }}'
      }
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
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
    >
      <Header>
        <Text
          id="containerTitle2"
          value="**Unlinked Odoo products**"
          verticalAlign="center"
        />
        <Text
          id="text1"
          style={{
            fontSize: "10px",
            fontWeight: "400",
            fontFamily: "Inter",
            color: "#8d9194",
          }}
          value="New products synced form Odoo that don't yet map to an artwork-job. Link to give them durable identity."
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
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
          style={{ map: { headerBackground: "canvas" } }}
        >
          <Header>
            <TextInput
              id="textInput1"
              iconBefore="bold/interface-search"
              label=""
              labelPosition="top"
              placeholder="Search"
            />
            <Select
              id="select3"
              captionByIndex=""
              colorByIndex=""
              data="{{ get_customer_filter_option.value }}"
              disabledByIndex=""
              emptyMessage="No options"
              fallbackTextByIndex=""
              hiddenByIndex=""
              iconByIndex=""
              imageByIndex=""
              label=""
              labelPosition="top"
              labels="{{ item.label }}"
              overlayMaxHeight={375}
              placeholder="Customer"
              showClear={true}
              showSelectionIndicator={true}
              tooltipByIndex=""
              values="{{ item.value }}"
            />
            <Select
              id="select4"
              captionByIndex=""
              colorByIndex=""
              data=""
              disabledByIndex=""
              emptyMessage="No options"
              fallbackTextByIndex=""
              hiddenByIndex=""
              iconByIndex=""
              imageByIndex=""
              itemMode="static"
              label=""
              labelPosition="top"
              labels=""
              overlayMaxHeight={375}
              placeholder="Synced"
              showClear={true}
              showSelectionIndicator={true}
              tooltipByIndex=""
              values=""
            >
              <Option id="00031" label="Last 24 hours" value="24h" />
              <Option id="00032" label="Last 7 days" value="7d" />
              <Option
                id="5de1f"
                disabled={false}
                hidden={false}
                label="Last 30 days"
                value="30d"
              />
            </Select>
          </Header>
          <View id="00030" viewKey="View 1">
            <Table
              id="table1"
              actionsOverflowPosition={1}
              cellSelection="none"
              clearChangesetOnSave={true}
              data="{{ get_unlinked_products.value }}"
              defaultSelectedRow={{
                mode: "index",
                indexType: "display",
                index: 0,
              }}
              dynamicColumnFormatOptions={{ link: {} }}
              dynamicColumnProperties={{ formatByIndex: "auto" }}
              dynamicRowHeights={true}
              emptyMessage="No rows found"
              enableSaveActions={true}
              heightType="auto"
              primaryKeyColumnId="e99ec"
              rowHeight="small"
              searchTerm="{{ textInput1.value }}"
              showBorder={true}
              showFooter={true}
              showHeader={true}
              toolbarPosition="bottom"
            >
              <Column
                id="e99ec"
                alignment="right"
                editable="false"
                editableOptions={{ showStepper: true }}
                format="decimal"
                formatOptions={{ showSeparators: true, notation: "standard" }}
                groupAggregationMode="sum"
                hidden="true"
                key="id"
                label="ID"
                placeholder="Enter value"
                position="center"
                size={30.765625}
                summaryAggregationMode="none"
              />
              <Column
                id="5543f"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                key="p_number"
                label="P-number"
                placeholder="Enter value"
                position="center"
                size={76.328125}
                summaryAggregationMode="none"
              />
              <Column
                id="3d07f"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                key="odoo_product_name"
                label="Odoo product name"
                placeholder="Enter value"
                position="center"
                size={137.078125}
                summaryAggregationMode="none"
              />
              <Column
                id="3dffa"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                hidden="true"
                key="product_display_name"
                label="Product display name"
                placeholder="Enter value"
                position="center"
                size={138.421875}
                summaryAggregationMode="none"
              />
              <Column
                id="4852e"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                hidden="true"
                key="size"
                label="Size"
                placeholder="Enter value"
                position="center"
                size={91.953125}
                summaryAggregationMode="none"
              />
              <Column
                id="eabdc"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                hidden="true"
                key="category"
                label="Category"
                placeholder="Enter value"
                position="center"
                size={122.34375}
                summaryAggregationMode="none"
              />
              <Column
                id="beb6e"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                key="customer_name"
                label="Customer"
                placeholder="Enter value"
                position="center"
                size={113.1875}
                summaryAggregationMode="none"
              />
              <Column
                id="15ff8"
                alignment="right"
                editableOptions={{ showStepper: true }}
                format="decimal"
                formatOptions={{ showSeparators: true, notation: "standard" }}
                groupAggregationMode="sum"
                hidden="true"
                key="customer_id"
                label="Customer ID"
                placeholder="Enter value"
                position="center"
                size={86.484375}
                summaryAggregationMode="none"
              />
              <Column
                id="7e681"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                hidden="true"
                key="customer_color"
                label="Customer color"
                placeholder="Enter value"
                position="center"
                size={103.015625}
                summaryAggregationMode="none"
              />
              <Column
                id="0c843"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                hidden="true"
                key="customer_initials"
                label="Customer initials"
                placeholder="Enter value"
                position="center"
                size={110.5}
                summaryAggregationMode="none"
              />
              <Column
                id="ad611"
                alignment="left"
                format="datetime"
                groupAggregationMode="none"
                hidden="true"
                key="synced_at"
                label="Synced at"
                placeholder="Enter value"
                position="center"
                size={148.921875}
                summaryAggregationMode="none"
              />
              <Column
                id="afb3d"
                alignment="left"
                editableOptions={{ spellCheck: false }}
                format="string"
                groupAggregationMode="none"
                key="synced_label"
                label="Synced"
                placeholder="Enter value"
                position="center"
                size={89}
                summaryAggregationMode="none"
              />
              <Action id="41d2b" icon="line/interface-link" label="Link">
                <Event
                  id="9f3694ad"
                  event="clickAction"
                  method="trigger"
                  params={{
                    map: {
                      options: {
                        map: {
                          additionalScope: {
                            map: { row: "{{ currentSourceRow }}" },
                          },
                        },
                      },
                    },
                  }}
                  pluginId="open_link_drawer"
                  type="datasource"
                  waitMs="0"
                  waitType="debounce"
                />
              </Action>
            </Table>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container4"
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
          id="containerTitle3"
          value="**Recent artwork-jobs**"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <ListViewBeta
          id="listView1"
          _primaryKeys="{{ i }}"
          data="{{ get_recent_artwork_jobs.value }}"
          itemWidth="200px"
          margin="0"
          numColumns="1"
          padding="0"
        >
          <Container
            id="container5"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="12px"
            showBody={true}
            style={{ map: { borderRadius: "0px" } }}
          >
            <Header>
              <Text
                id="containerTitle4"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="00030" viewKey="View 1">
              <Text
                id="text5"
                style={{ map: { color: "primary" } }}
                value={'{{ "**" + item.artwork_job_code + "**" }}'}
                verticalAlign="center"
              />
              <Text
                id="text6"
                style={{
                  fontSize: "10px",
                  fontWeight: "400",
                  fontFamily: "Inter",
                }}
                value={'{{ item.artwork_job_name + " · " + item.size_label }}'}
                verticalAlign="center"
              />
              <Avatar
                id="avatar2"
                fallback="{{ item.customer_initials }}"
                label="{{ item.customer_name }}"
                margin="4px 4px"
                style={{ map: { background: "{{ item.customer_color }}" } }}
              />
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
    <Container
      id="container6"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
    >
      <Header>
        <Text
          id="containerTitle5"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Text
          id="text2"
          style={{ map: { color: "#393e4f" } }}
          value="**Why link?** Artwork-jobs are the durable identity that survives product churn. When a customer reorders, Odoo mints a new P-number for that print run — but the carton, the size, the artwork are the same job. Linking the P-number to its artwork-job means inventory, call-offs, and history all roll up under one stable code (AJ-XXXXX) instead of fragmenting across reprints.
  
Unlinked products don't show up in Inventory or Call-offs. Linking them takes them out of this queue and into circulation."
          verticalAlign="center"
        />
      </View>
    </Container>
  </View>
</Container>
