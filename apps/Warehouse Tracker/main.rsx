<MobileApp>
  <Include src="./functions.rsx" />
  <TabScreen
    id="tabscreen"
    defaultTab="Inspections"
    items={[{ screen: "list", title: "", icon: "" }]}
  />
  <Include src="./src/list.rsx" />
  <Include src="./src/detail.rsx" />
  <Frame id="$main" padding="8px 12px" sticky={false} type="main" />
</MobileApp>
