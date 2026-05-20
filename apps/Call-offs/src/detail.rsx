<Screen
  id="detail"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={2}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug={null}
  uuid="be2de77e-fca0-4f4b-8632-7dafac59eb5c"
>
  <Folder id="_init">
    <JavascriptQuery
      id="_init_detail"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/_init_detail.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="_requests">
    <SqlQueryUnified
      id="_GET_call_off_detail"
      _additionalScope={["call_off_id"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/_GET_call_off_detail.sql", "string")}
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
      id="_GET_call_off_detail_lines"
      _additionalScope={["call_off_id"]}
      query={include("../lib/_GET_call_off_detail_lines.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_UPDATE_call_off_state"
      _additionalScope={["new_state", "call_off_id"]}
      notificationDuration={4.5}
      query={include("../lib/_UPDATE_call_off_state.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="getters">
    <Function
      id="get_call_off_detail"
      funcBody={include("../lib/get_call_off_detail.js", "string")}
    />
    <Function
      id="get_call_off_detail_lines"
      funcBody={include("../lib/get_call_off_detail_lines.js", "string")}
    />
    <Function
      id="get_call_off_activity"
      funcBody={include("../lib/get_call_off_activity.js", "string")}
    />
    <Function
      id="get_call_off_progress"
      funcBody={include("../lib/get_call_off_progress.js", "string")}
    />
  </Folder>
  <Folder id="setters">
    <JavascriptQuery
      id="ship_call_off"
      notificationDuration={4.5}
      query={include("../lib/ship_call_off.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="cancel_call_off"
      notificationDuration={4.5}
      query={include("../lib/cancel_call_off.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Include src="./splitPaneFrame1.rsx" />
  <Frame
    id="$main3"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./container6.rsx" />
  </Frame>
</Screen>
