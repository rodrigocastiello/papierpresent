<SidebarFrame
  id="sidebarFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  isHiddenOnMobile={true}
  padding="8px 12px"
  width="large"
>
  <Avatar
    id="avatar1"
    fallback="{{ current_user.fullName }}"
    imageSize={32}
    label="{{ current_user.fullName }}"
    labelCaption="{{ current_user.email }}"
    margin="4px 4px"
    src="{{ current_user.profilePhotoUrl }}"
    style={{ map: { background: "automatic" } }}
  />
  <Navigation
    id="navigation1"
    data="{{ retoolContext.pages }}"
    highlightByIndex="{{ retoolContext.currentPage === item.id }}"
    labels="{{ item.title || item.id }}"
    orientation="vertical"
    src={null}
    srcType={null}
  >
    <Option id="00030" icon="bold/interface-home-3" label="Home" />
    <Option id="00031" icon="bold/interface-user-multiple" label="Customers" />
    <Option id="00032" icon="bold/interface-setting-cog" label="Settings" />
    <Event
      id="mockEventHandlerId1"
      event="click"
      method="openPage"
      params={{ map: { pageName: "{{ item.id }}" } }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Navigation>
</SidebarFrame>
