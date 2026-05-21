<Screen
  id="link"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={0}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
  uuid="7990a8a4-d615-47e7-8704-277c40840bb3"
>
  <Folder id="setters">
    <JavascriptQuery
      id="open_link_drawer"
      _additionalScope={["row"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/open_link_drawer.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="score_artwork_job_match"
      _additionalScope={["row"]}
      notificationDuration={4.5}
      query={include("../lib/score_artwork_job_match.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="link_product"
      notificationDuration={4.5}
      query={include("../lib/link_product.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="create_artwork_job"
      notificationDuration={4.5}
      query={include("../lib/create_artwork_job.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="link_suggested"
      _additionalScope={["artwork_job"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/link_suggested.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="cancel_link"
      notificationDuration={4.5}
      query={include("../lib/cancel_link.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="linkClickHandler"
      notificationDuration={4.5}
      query={include("../lib/linkClickHandler.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="getters">
    <Function
      id="get_unlinked_products"
      funcBody={include("../lib/get_unlinked_products.js", "string")}
    />
    <Function
      id="get_recent_artwork_jobs"
      funcBody={include("../lib/get_recent_artwork_jobs.js", "string")}
    />
    <Function
      id="get_artwork_job_candidates"
      funcBody={include("../lib/get_artwork_job_candidates.js", "string")}
    />
  </Folder>
  <Folder id="_requests">
    <SqlQueryUnified
      id="_GET_unlinked_products"
      isMultiplayerEdited={false}
      query={include("../lib/_GET_unlinked_products.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_recent_artwork_jobs"
      isMultiplayerEdited={false}
      query={include("../lib/_GET_recent_artwork_jobs.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_artwork_jobs_stats"
      isMultiplayerEdited={false}
      query={include("../lib/_GET_artwork_jobs_stats.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_GET_customer_artwork_jobs"
      isMultiplayerEdited={false}
      query={include("../lib/_GET_customer_artwork_jobs.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_LINK_product_to_artwork_job"
      _additionalScope={["payload"]}
      isMultiplayerEdited={false}
      query={include("../lib/_LINK_product_to_artwork_job.sql", "string")}
      resourceDisplayName="retool_db"
      resourceName="83bbb14a-41f7-4f23-9be3-2529164d13ee"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="_CREATE_artwork_job"
      _additionalScope={["payload"]}
      isMultiplayerEdited={false}
      query={include("../lib/_CREATE_artwork_job.sql", "string")}
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
      id="_init_link"
      notificationDuration={4.5}
      query={include("../lib/_init_link.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="_states">
    <State id="_selected_product" />
    <State id="_selected_artwork_job" />
  </Folder>
  <Include src="./drawerFrame1.rsx" />
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
