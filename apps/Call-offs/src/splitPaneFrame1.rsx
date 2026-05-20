<SplitPaneFrame
  id="splitPaneFrame1"
  enableFullBleed={true}
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  isHiddenOnMobile={true}
  padding="8px 12px"
  position="right"
  showFooterBorder={false}
  showHeaderBorder={false}
  width="35%"
>
  <Container
    id="container11"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    padding="12px"
    showBody={true}
    style={{}}
  >
    <View id="00030" viewKey="View 1">
      <Text
        id="containerTitle9"
        style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Inter" }}
        value="**Activity**"
        verticalAlign="center"
      />
      <Timeline
        id="eventList1"
        isGrouped={true}
        items="{{ get_call_off_activity?.value?.items }}"
        renderAsHtml={true}
        sortedDesc={true}
        timestamps="{{ get_call_off_activity?.value?.timestamps }}"
      />
    </View>
  </Container>
</SplitPaneFrame>
