library augment '../network_search_item.dart',

augment class NetworkSearchItem {
  @FreezedUnionValue('bili_live')
  const factory NetworkSearchItem.biliLive(
    @JsonKey('rank_offset')
    int rankOffset,
    int uid,
    String tags,
    @JsonKey('live_time')
    String liveTime,
    String uname,
    String uface,
    String face,
    @JsonKey('user_cover')
    String userCover,
    String type,
    HtmlTitle title,
    String cover,
    int online,
    @JsonKey('rank_index')
    int rankIndex,
    @JsonKey('rank_score')
    int rankScore,
    int roomid,
    int attentions,
    @JsonKey('cate_name')
    String cateName,
    @JsonKey('watched_show')
    Map watchedShow,
  ) = NetworkSearchLiveItem;
}