<MobileApp>
  <Include src="./functions.rsx" />
  <Include src="./src/detail.rsx" />
  <Include src="./src/list.rsx" />
  <TabScreen
    id="tabscreen"
    defaultTab="Inspections"
    items={[{ screen: "list", title: "", icon: "" }]}
  />
  <Frame id="$main" padding="8px 12px" sticky={false} type="main" />
</MobileApp>
