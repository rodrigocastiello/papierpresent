<SidebarFrame
  id="sidebarFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  isHiddenOnMobile={true}
  padding="8px 12px"
  style={{ map: { background: "surfacePrimary" } }}
  width="large"
>
  <Body>
    <Avatar
      id="avatar2"
      fallback="{{ current_user.fullName }}"
      imageSize={32}
      label="Papier Present"
      labelCaption="Warehouse console"
      src="{{ _GET_logo.data?.url }}"
      style={{ background: "automatic", borderRadius: "0%" }}
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
        icon="line/interface-setting-menu-1"
        iconPosition="left"
        itemType="page"
        key="dce1a"
        label="Call-offs"
      />
      <Option
        id="eeef8"
        appTarget="a7f4c8d4-52d0-11f1-8bc9-57003f5dec9c"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="List"
        parentKey="dce1a"
        screenTargetId="list"
      />
      <Option
        id="56f48"
        appTarget="a7f4c8d4-52d0-11f1-8bc9-57003f5dec9c"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="Create"
        parentKey="dce1a"
        screenTargetId="create"
      />
      <Option
        id="00031"
        icon="line/shipping-box-2"
        iconPosition="left"
        itemType="page"
        label="Inventory"
      />
      <Option
        id="00032"
        icon="line/interface-arrows-expand-3"
        iconPosition="left"
        itemType="page"
        label="Adjustments"
      />
      <Option
        id="b2970"
        disabled={false}
        hidden={false}
        icon="line/interface-file-text"
        iconPosition="left"
        itemType="app"
        label="Artwork jobs"
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
  </Body>
  <Footer>
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
  </Footer>
</SidebarFrame>
