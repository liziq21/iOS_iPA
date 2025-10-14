import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart' show parse;
import 'package:json_annotation/json_annotation.dart';
import '../../bili/search_type.dart';
import '../user/network_user_official_verify.dart';

part 'network_type_search_result.freezed.dart';
part 'network_type_search_result.g.dart';

@Freezed(unionKey: 'type')
sealed class NetworkTypeSearchResult with _$NetworkTypeSearchResult {
  const factory NetworkTypeSearchResult(
    String type,
  ) = NetworkUnSearchResult;
  
  const factory NetworkTypeSearchResult.article(
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
    SearchType type,
    int templateId,
    @JsonKey(name: 'category_name')
    String categoryName,
  ) = NetworkArticleSearchResult;
  
  const factory NetworkTypeSearchResult.live(
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
    SearchType type,
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
  ) = NetworkLiveSearchResult;
  
  const factory NetworkTypeSearchResult.biliUser(
    SearchType type,
    int mid,
    String uname,
    String usign,
    int fans,
    int videos,
    String upic,
    @JsonKey(name: 'face_nft')
    int faceNft,
    @JsonKey(name: 'face_nft_type')
    int faceNftType,
    @JsonKey(name: 'verify_info')
    String verifyInfo,
    int level,
    int gender,
    @JsonKey(name: 'is_upuser')
    int isUpUser,
    @JsonKey(name: 'is_live')
    int isLive,
    @JsonKey(name: 'room_id')
    int roomId,
    @JsonKey(name: 'official_verify')
    NetworkUserOfficialVerify officialVerify,
    @JsonKey(name: 'is_senior_member')
    int isSeniorMember,
  ) = NetworkBiliUserSearchResult;

  const factory NetworkTypeSearchResult.mediaBangumi(
    SearchType type,
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
    String desc,
    int pubtime,
    @JsonKey(name: 'media_mode')
    int mediaMode,
    @JsonKey(name: 'media_score')
    Map mediaScore,
    @JsonKey(name: 'index_show')
    String indexShow,
  ) = NetworkMediaBangumiSearchResult;
  
  const factory NetworkTypeSearchResult.mediaFt(
    SearchType type,
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
    String desc,
    int pubtime,
    @JsonKey(name: 'media_mode')
    int mediaMode,
    @JsonKey(name: 'media_score')
    Map mediaScore,
    @JsonKey(name: 'index_show')
    String indexShow,
  ) = NetworkMediaFtSearchResult;

  const factory NetworkTypeSearchResult.video(
    SearchType type,
    int id,
    String author,
    int mid,
    String typeid,
    String typename,
    String arcurl,
    int aid,
    String bvid,
    HtmlTitle title,
    String description,
    String pic,
    int play,
    int favorites,
    String tag,
    int review,
    int pubdate,
    int senddate,
    String duration,
    bool badgepay,
    @JsonKey(name: 'is_union_video')
    int isUnionVideo,
    int like,
    String upic,
    String corner,
    String cover,
    String desc,
    String url,
    int danmaku,
  ) = NetworkVideoSearchResult;

  factory NetworkTypeSearchResult.fromJson(Map<String, dynamic> json)
    => _$NetworkTypeSearchResultFromJson(json);
}

class HtmlTitle {
  HtmlTitle(this._title);
  
  factory HtmlTitle.fromJson(String title) => HtmlTitle(title);
  
  final String _title;

  String stripTags() => parse(_title).body?.text ?? _title;
  
  @override
  String toString() => _title;
}