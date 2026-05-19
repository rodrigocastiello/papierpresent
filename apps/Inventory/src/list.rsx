<Screen
  id="list"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="List"
  urlSlug=""
  uuid="692bc470-1f1d-4670-9cb9-67c0489027bf"
>
  <SqlQueryUnified
    id="_GET_inventory"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/_GET_inventory.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="_init_inventory"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/_init_inventory.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <Function
    id="get_inventory"
    funcBody={include("../lib/get_inventory.js", "string")}
  />
  <Function
    id="get_inventory_summary"
    funcBody={include("../lib/get_inventory_summary.js", "string")}
  />
  <SqlQueryUnified
    id="_GET_customers"
    isMultiplayerEdited={false}
    query={include("../lib/_GET_customers.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <Function
    id="get_inventory_categories"
    funcBody={include("../lib/get_inventory_categories.js", "string")}
  />
  <Function
    id="get_all_customers"
    funcBody={include("../lib/get_all_customers.js", "string")}
  />
  <Function
    id="get_rack_tag_options"
    funcBody={include("../lib/get_rack_tag_options.js", "string")}
  />
  <Frame
    id="$main"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Include src="./container1.rsx" />
  </Frame>
</Screen>
