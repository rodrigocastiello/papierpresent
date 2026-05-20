<GlobalFunctions>
  <Folder id="_init">
    <JavascriptQuery
      id="_init_calloffs"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/_init_calloffs.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="_state">
    <State id="_call_off_id" />
  </Folder>
  <Folder id="_requests">
    <SqlQueryUnified
      id="_GET_calloffs"
      query={include("./lib/_GET_calloffs.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_lines"
      isMultiplayerEdited={false}
      query={include("./lib/_GET_lines.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      warningCodes={[]}
    />
  </Folder>
  <Folder id="getters">
    <Function
      id="get_call_offs"
      funcBody={include("./lib/get_call_offs.js", "string")}
    />
    <Function
      id="get_selected_call_off"
      funcBody={include("./lib/get_selected_call_off.js", "string")}
    />
  </Folder>
  <Folder id="setters">
    <JavascriptQuery
      id="open_detail_screen"
      _additionalScope={["call_off_id"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/open_detail_screen.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="open_list_screen"
      notificationDuration={4.5}
      query={include("./lib/open_list_screen.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
</GlobalFunctions>
