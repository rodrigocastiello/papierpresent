<Screen
  id="list"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  gap={8}
  padding={{
    ordered: [{ left: 12 }, { right: 12 }, { top: 0 }, { bottom: 0 }],
  }}
  refreshing=""
  title="Call-offs"
  uuid="2d097363-67f6-4971-91fb-3078f72c94ff"
>
  <CollectionView
    id="listCollection1"
    bodyByIndex={
      '{{ item.customer_name }} - {{ item.line_count }} {{ item.line_count === 1 ? "line" : "lines" }}'
    }
    cardStyle="elevated"
    data="{{ get_call_offs.value }}"
    prefixIconByIndex="bold/interface-user-single"
    prefixIconColorByIndex=""
    prefixImageFitByIndex="cover"
    prefixImageShapeByIndex="square"
    prefixImageSizeByIndex="1 to 1"
    prefixImageSourceByIndex=""
    prefixTypeByIndex="none"
    showSeparator={true}
    subtitleByIndex=""
    subtitleLengthByIndex="2"
    suffixIconByIndex="bold/interface-arrows-button-right"
    suffixTextByIndex=""
    suffixTypeByIndex="text+icon"
    suffixValueByIndex="false"
    titleByIndex="{{ item.code }}"
  >
    <Event
      id="2e615c95"
      event="press"
      method="trigger"
      params={{
        map: {
          options: {
            onSuccess: null,
            onFailure: null,
            additionalScope: { map: { call_off_id: "{{ item?.id }}" } },
          },
        },
      }}
      pluginId="open_detail_screen"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </CollectionView>
</Screen>
