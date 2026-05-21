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
      value={
        '**Link {{ _selected_product.value?.p_number || "—" }} to artwork-job**'
      }
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
        method="trigger"
        params={{
          map: {
            options: {
              object: {
                onSuccess: null,
                onFailure: null,
                additionalScope: null,
              },
            },
          },
        }}
        pluginId="cancel_link"
        type="datasource"
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
        <KeyValue
          id="keyValue1"
          data={
            '{\n  customer: {{ _selected_product.value?.customer_name || "—" }},\n  from_odoo: {{ _selected_product.value?.odoo_product_name || "—" }},\n}'
          }
          editIcon="bold/interface-edit-pencil"
          enableSaveActions={true}
          groupLayout="singleColumn"
          labelWrap={true}
        >
          <Property
            id="customer"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="Customer"
          />
          <Property
            id="from_odoo"
            editable="false"
            editableOptions={{ spellCheck: false }}
            format="string"
            formatOptions={{}}
            hidden="false"
            label="From odoo"
          />
        </KeyValue>
      </Header>
      <View id="00030" viewKey="View 1">
        <Include src="./tabbedContainer1.rsx" />
      </View>
    </Container>
  </Body>
  <Footer>
    <Container
      id="group1"
      _flexWrap={true}
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
        <Button id="button2" style={{}} styleVariant="outline" text="Cancel">
          <Event
            id="d56e0a7e"
            event="click"
            method="trigger"
            params={{}}
            pluginId="cancel_link"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="button3"
          disabled={
            '{{ tabs1.value === "Create new" ? (!_selected_product.value || !nameInput.value || !categorySelect.value) :\n  (!_selected_product.value || !_selected_artwork_job.value) }}'
          }
          text={
            '{{ tabs1.value === "Create new" ? "Create & link" : ("Link to " + (_selected_artwork_job.value?.artwork_job_code ||\n  "—")) }}'
          }
        >
          <Event
            id="074c8449"
            event="click"
            method="trigger"
            params={{}}
            pluginId="linkClickHandler"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </Footer>
</DrawerFrame>
