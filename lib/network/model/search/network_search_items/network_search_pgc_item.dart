library augment '../network_search_item.dart';

augment class NetworkSearchItem {
  @FreezedUnionValue('media_bangumi')
  const factory NetworkSearchItem.mediaBangumi(
    String type
    @JsonKey(name: 'media_id')
    int mediaId,
    HtmlTitle title,
    @JsonKey(name: 'org_title')
    String orgTitle,
    @JsonKey(name: 'media_type')
    int mediaType,
    String cv,
    String staff,
    @JsonKey(name: 'season_id')
    int seasonId,
    @JsonKey(name: 'is_avid')
    bool isAvid,
    @JsonKey(name: 'hit_epids')
    String hitEpids,
    @JsonKey(name: 'season_type')
    int seasonType,
    @JsonKey(name: 'season_type_name')
    String seasonTypeName,
    String url,
    @JsonKey(name: 'button_text')
    String buttonText,
    @JsonKey(name: 'is_follow')
    int isFollow,
    @JsonKey(name: 'is_selection')
    int isSelection,
    String cover,
    String areas,
    String styles,
    @JsonKey(name: 'goto_url')
    String gotoUrl,
    String desc
    int pubtime,
    @JsonKey(name: 'media_mode')
    int mediaMode,
    @JsonKey(name: 'media_score')
    Map mediaScore,
    @JsonKey(name: 'index_show')
    String indexShow,
  ) = NetworkSearchPgcItem;
}