library augment '../network_search_item.dart';

augment class NetworkSearchItem {
  const factory NetworkSearchItem.article(
    int pubtime,
    @JsonKey(name: 'pub_time')
    int pubTime,
    int like,
    HtmlTitle title,
    @JsonKey(name: 'rank_offset')
    int rankOffset,
    int mid,
    List<String> imageUrls,
    int id,
    @JsonKey(name: 'category_id')
    int categoryId,
    int view,
    int reply,
    String desc,
    @JsonKey(name: 'rank_score')
    int rankScore,
    String type,
    int templateId,
    @JsonKey(name: 'category_name')
    String categoryName,
  ) = NetworkSearchArticleItem;
}