<Screen
  id="create"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={1}
  _searchParams={[]}
  browserTitle={null}
  title="Create"
  urlSlug={null}
  uuid="3cc840c8-2d05-401d-8f89-ff32803c0e4d"
>
  <Folder id="setters">
    <JavascriptQuery
      id="create_adjustment"
      notificationDuration={4.5}
      query={include("../lib/create_adjustment.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="validate_adjustment"
      notificationDuration={4.5}
      query={include("../lib/validate_adjustment.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="open_list_page"
      notificationDuration={4.5}
      query={include("../lib/open_list_page.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="getters">
    <Function
      id="get_customers"
      funcBody={include("../lib/get_customers.js", "string")}
    />
    <Function
      id="get_artwork_jobs"
      funcBody={include("../lib/get_artwork_jobs.js", "string")}
    />
    <Function
      id="get_products"
      funcBody={include("../lib/get_products.js", "string")}
    />
    <Function
      id="get_placements"
      funcBody={include("../lib/get_placements.js", "string")}
    />
    <Function
      id="get_current_on_hand"
      funcBody={include("../lib/get_current_on_hand.js", "string")}
    />
    <Function
      id="get_new_on_hand"
      funcBody={include("../lib/get_new_on_hand.js", "string")}
    />
    <Function
      id="get_audit_preview"
      funcBody={include("../lib/get_audit_preview.js", "string")}
    />
  </Folder>
  <Folder id="_requests">
    <SqlQueryUnified
      id="_GET_customers"
      query={include("../lib/_GET_customers.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_artwork_jobs"
      query={include("../lib/_GET_artwork_jobs.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_products"
      query={include("../lib/_GET_products.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_placements"
      query={include("../lib/_GET_placements.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_CREATE_adjustment"
      _additionalScope={["payload"]}
      isMultiplayerEdited={false}
      query={include("../lib/_CREATE_adjustment.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
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
    <Include src="./container2.rsx" />
  </Frame>
</Screen>
