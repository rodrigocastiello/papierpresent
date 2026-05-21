<Container
  id="container9"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  style={{
    border:
      '{{ _selected_artwork_job.value?.artwork_job_id === item.artwork_job_id ? "#393E4F" : "#E5E7EB" }}',
    background:
      '{{ _selected_artwork_job.value?.artwork_job_id === item.artwork_job_id ? "#E7EEF6" : "transparent"\n  }}',
  }}
>
  <Header>
    <Text id="containerTitle7" value="#### {{ item }}" verticalAlign="center" />
  </Header>
  <View id="00030" viewKey="View 1">
    <Text
      id="text15"
      style={{ map: { color: "primary" } }}
      value="**{{ item.artwork_job_code }}**"
      verticalAlign="center"
    />
    <TagsWidget2
      id="tags2"
      _colorByIndex={[""]}
      _hiddenByIndex={["{{ (item.sizes || []).length < 2 }}"]}
      _iconByIndex={[""]}
      _ids={["c6ef0"]}
      _imageByIndex={[""]}
      _labels={[""]}
      _textColorByIndex={[""]}
      _tooltipByIndex={[""]}
      _values={["{{ (item.sizes || []).length }} SIZES"]}
      allowWrap={true}
      colorByIndex=""
      data=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      itemMode="static"
      labels=""
      margin="0"
      style={{ fontSize: "10px", fontWeight: "500", fontFamily: "Inter" }}
      textColorByIndex=""
      tooltipByIndex=""
      values=""
    />
    <Text
      id="text16"
      value="**{{ Number(item.on_hand_total || 0).toLocaleString() }}**"
      verticalAlign="center"
    />
    <Text id="text19" value="**ON-HAND**" verticalAlign="center" />
    <Text
      id="text17"
      value={
        '{{ item.artwork_job_name + " · " + (item.sizes || []).join(" & ") }}'
      }
      verticalAlign="center"
    />
    <Text
      id="text18"
      style={{
        color: "#8d9194",
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
      }}
      value={
        '{{ item.customer_name + " · " + item.p_number_count + " P-numbers (" + (item.p_numbers || []).join(", ") + ") · " + Number(item.on_hand_total || 0).toLocaleString() + " u on-hand" }}'
      }
      verticalAlign="center"
    />
  </View>
  <Event
    id="05283c8e"
    event="click"
    method="trigger"
    params={{
      map: {
        options: {
          map: { additionalScope: { map: { artwork_job: "{{ item }}" } } },
        },
      },
    }}
    pluginId="link_suggested"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</Container>
