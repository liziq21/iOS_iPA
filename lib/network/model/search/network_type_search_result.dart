import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart' show parse;
//import 'package:json_annotation/json_annotation.dart';

import 'package:f_biuli/bili/search_type.dart';
import 'package:f_biuli/network/model/user/network_user_official_verify.dart';

part 'network_type_search_result.freezed.dart';
part 'network_type_search_result.g.dart';
/*
@JsonEnum()
enum SearchType {
  article,
  biliUser,
  mediaBangumi,
  mediaFt,
  live,
  liveRoom,
  liveUser,
  photo,
  topic,
  video,
  un
}
*/
@Freezed(unionKey: 'type')
sealed class NetworkTypeSearchResult with _$NetworkTypeSearchResult {
  const factory NetworkTypeSearchResult(
    //@JsonKey(unknownEnumValue: SearchType.un)
    String type,
  ) = NetworkUnSearchResult;
  
  const factory NetworkTypeSearchResult.article(
    int pubtime,

    int pubTime,
    int like,
    HtmlTitle title,

    int rankOffset,
    int mid,
    List<String> imageUrls,
    int id,

    int categoryId,
    int view,
    int reply,
    String desc,

    int rankScore,
    SearchType type,
    int templateId,

    String categoryName,
  ) = NetworkArticleSearchResult;
  
  const factory NetworkTypeSearchResult.liveRoom(
    SearchType type,

    int rankOffset,
    int uid,
    String tags,

    String liveTime,
    String uname,
    String uface,
    String face,

    String userCover,
    HtmlTitle title,
    String cover,
    int online,

    int rankIndex,

    int rankScore,
    int roomid,
    int attentions,

    String cateName,

    Map watchedShow,
  ) = NetworkLiveRoomSearchResult;
  
  const factory NetworkTypeSearchResult.liveUser(
    SearchType type,
  ) = NetworkLiveUserSearchResult;
  
  const factory NetworkTypeSearchResult.biliUser(
    SearchType type,
    int mid,
    String uname,
    String usign,
    int fans,
    int videos,
    String upic,
    int faceNft,
    int faceNftType,
    String verifyInfo,
    int level,
    int gender,
    int isUpUser,
    int isLive,
    int roomId,
    NetworkUserOfficialVerify officialVerify,
    int isSeniorMember,
  ) = NetworkBiliUserSearchResult;

  const factory NetworkTypeSearchResult.mediaBangumi(
    SearchType type,
    int mediaId,
    HtmlTitle title,
    String orgTitle,
    int mediaType,
    String cv,
    String staff,
    int seasonId,
    bool isAvid,
    String hitEpids,
    int seasonType,
    String seasonTypeName,
    String url,
    String buttonText,
    int isFollow,
    int isSelection,
    String cover,
    String areas,
    String styles,
    String gotoUrl,
    String desc,
    int pubtime,
    int mediaMode,
    Map mediaScore,
    String indexShow,
  ) = NetworkMediaBangumiSearchResult;
  
  const factory NetworkTypeSearchResult.mediaFt(
    SearchType type,
    int mediaId,
    HtmlTitle title,
    String orgTitle,
    int mediaType,
    String cv,
    String staff,
    int seasonId,
    bool isAvid,
    String hitEpids,
    int seasonType,
    String seasonTypeName,
    String url,
    String buttonText,
    int isFollow,
    int isSelection,
    String cover,
    String areas,
    String styles,
    String gotoUrl,
    String desc,
    int pubtime,
    int mediaMode,
    Map mediaScore,
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