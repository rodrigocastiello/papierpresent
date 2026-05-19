<GlobalFunctions>
  <Folder id="_init">
    <JavascriptQuery
      id="_init_global"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/_init_global.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="_requests">
    <RetoolStorageQuery
      id="_GET_logo"
      actionType="read"
      fileId="64893029-7bf9-45df-858c-bdaa0789e788"
      folderName="/"
      isMultiplayerEdited={false}
      resourceDisplayName="retool_storage"
      resourceName="retool_storage"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
    />
    <SqlQueryUnified
      id="_GET_customers"
      isMultiplayerEdited={false}
      query={include("./lib/_GET_customers.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_call_offs"
      query={include("./lib/_GET_call_offs.sql", "string")}
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
      id="get_customers"
      funcBody={include("./lib/get_customers.js", "string")}
    />
  </Folder>
</GlobalFunctions>
