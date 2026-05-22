<Container
  id="container8"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  style={{
    background:
      '{{ _selected_artwork_job.value?.artwork_job_id ===\n  get_artwork_job_candidates.value?.suggested?.artwork_job_id ? "#E7EEF6" : "transparent" }}',
    border:
      '{{ _selected_artwork_job.value?.artwork_job_id ===\n  get_artwork_job_candidates.value?.suggested?.artwork_job_id ? "#393E4F" : "#E5E7EB" }}',
  }}
>
  <Header>
    <Text
      id="containerTitle6"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Text
      id="text14"
      style={{ map: { color: "primary" } }}
      value="**{{ get_artwork_job_candidates.value?.suggested?.artwork_job_code }}**"
      verticalAlign="center"
    />
    <TagsWidget2
      id="tags1"
      _colorByIndex={["{{ theme.highlight }}"]}
      _hiddenByIndex={[false]}
      _iconByIndex={["bold/interface-favorite-star"]}
      _ids={["c6ef0"]}
      _imageByIndex={[""]}
      _labels={[""]}
      _textColorByIndex={[""]}
      _tooltipByIndex={[""]}
      _values={["BEST MATCH"]}
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
      value="{{ self.values }}"
      values=""
    />
    <Text
      id="text10"
      value="**{{ Number(get_artwork_job_candidates.value?.suggested?.on_hand_total || 0).toLocaleString() }}**"
      verticalAlign="center"
    />
    <Text id="text11" value="**ON-HAND**" verticalAlign="center" />
    <Text
      id="text9"
      value={
        '{{ get_artwork_job_candidates.value?.suggested?.artwork_job_name + " · " + \n  (get_artwork_job_candidates.value?.suggested?.sizes || []).join(" & ") }}'
      }
      verticalAlign="center"
    />
    <Text
      id="text12"
      style={{
        color: "#8d9194",
        fontSize: "10px",
        fontWeight: "400",
        fontFamily: "Inter",
      }}
      value={
        '{{ get_artwork_job_candidates.value?.suggested?.customer_name + " · " + \n  get_artwork_job_candidates.value?.suggested?.p_number_count + " P-number" + \n  (get_artwork_job_candidates.value?.suggested?.p_number_count === 1 ? "" : "s") + " (" + \n  (get_artwork_job_candidates.value?.suggested?.p_numbers || []).join(", ") + ") · " + \n  Number(get_artwork_job_candidates.value?.suggested?.on_hand_total || 0).toLocaleString() + " u on-hand" }}'
      }
      verticalAlign="center"
    />
  </View>
  <Event
    id="3627ab38"
    event="click"
    method="trigger"
    params={{
      map: {
        options: {
          map: {
            additionalScope: {
              map: {
                artwork_job:
                  "{{ get_artwork_job_candidates.value?.suggested }}",
              },
            },
          },
        },
      },
    }}
    pluginId="link_suggested"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</Container>
