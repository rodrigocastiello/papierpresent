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
    appTargetByIndex=""
    captionByIndex=""
    data=""
    disabledByIndex=""
    hiddenByIndex=""
    highlightByIndex=""
    iconByIndex=""
    iconPositionByIndex=""
    itemMode="static"
    itemTypeByIndex=""
    keyByIndex=""
    labels=""
    orientation="vertical"
    parentKeyByIndex=""
    persistUrlParamsByIndex=""
    screenTargetByIndex=""
    screenTargetIdByIndex=""
    src={null}
    srcType={null}
    tooltipByIndex=""
  >
    <Option
      id="00030"
      appTarget="a7f4c8d4-52d0-11f1-8bc9-57003f5dec9c"
      icon="line/interface-setting-menu-1"
      iconPosition="left"
      itemType="app"
      screenTargetId="list"
    />
    <Option
      id="00031"
      appTarget="b9da3b32-53b7-11f1-8674-3b90e592214a"
      icon="line/shipping-box-2"
      iconPosition="left"
      itemType="app"
      screenTargetId="list"
    />
    <Option
      id="00032"
      appTarget="5b1f6d90-551c-11f1-957b-1330d0ebd223"
      icon="line/interface-arrows-expand-3"
      iconPosition="left"
      itemType="app"
      screenTargetId="list"
    />
    <Option
      id="20e5a"
      appTarget="dcb19522-553a-11f1-91b4-5f0e5d89d19d"
      disabled={false}
      hidden={false}
      icon="line/interface-file-text"
      iconPosition="left"
      itemType="app"
      screenTargetId="link"
    />
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
