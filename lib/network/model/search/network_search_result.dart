import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart' show parse;
//import 'package:json_annotation/json_annotation.dart';

import 'package:f_biuli/bili/search_result_type.dart';
import 'package:f_biuli/network/model/user/network_user_official_verify.dart';

part 'network_search_result.freezed.dart';
part 'network_search_result.g.dart';

// {8} *"([^"]+)": (.*$)
// int $1, // $2

@Freezed(unionKey: 'type')
sealed class NetworkSearchResult with _$NetworkSearchResult {

  const factory NetworkSearchResult(String: type) = Unknown;
  
  const factory NetworkSearchResult.article(
    int categoryId;
    String categoryName,
    String commentUrl,
    String desc,
    int id,
    List<String> imageUrls,
    int isComment,
    bool isFold,
    bool isRk1,
    int like,
    int mid,
    int pubTime,
    int rankIndex,
    int rankOffset,
    int reply,
    int spreadId,
    int subType,
    int templateId,
    HtmlTitle title,
    SearchResultType type,
    String version,
    int view,
  ) = NetworkArticleSearchResult;
  
  const factory NetworkSearchResult.biliUser(
    SearchResultType type,
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
    int isUpuser,
    int isLive,
    int roomId,
    List<NetworkBiliUserRes> res,
    NetworkUserOfficialVerify officialVerify,
    int isSeniorMember,
  ) = NetworkBiliUserSearchResult;

  const factory NetworkSearchResult.mediaBangumi(
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
    int isSelection,
    String cover,
    String areas,
    String styles,
    String gotoUrl,
    String desc,
    int pubtime,
    int mediaMode,
    NetworkMediaScore mediaScore,
    String indexShow,
  ) = NetworkMediaBangumiSearchResult;
  
  const factory NetworkSearchResult.mediaFt(
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
    String cover,
    String areas,
    String styles,
    String gotoUrl,
    String desc,
    int pubtime,
    int mediaMode,
    NetworkMediaScore mediaScore,
    String indexShow,
  ) = NetworkMediaFtSearchResult;

  const factory NetworkSearchResult.liveRoom(
    SearchResultType type,
    int area,
    int attentions,
    String cateName,
    String cover,
    int isLiveRoomInline,
    int liveStatus,
    String liveTime,
    int online,
    int rankIndex,
    int rankOffset,
    int roomid,
    int shortId,
    String tags,
    HtmlTitle title,
    String uface,
    int uid,
    String uname,
    String userCover,
  ) = NetworkLiveRoomSearchResult;
  
  const factory NetworkSearchResult.liveUser(
    SearchType type,
    int area,
    int areaV2Id,
    int attentions,
    String cateName,
    int id,
    bool isLive,
    int liveStatus,
    String liveTime,
    int rankIndex,
    int rankOffset,
    int roomid,
    String tags,
    String uface,
    int uid,
    HtmlTitle uname: '央视网快<em class=\'keyword\">看</em>"
  ) = NetworkLiveUserSearchResult;

  const factory NetworkSearchResult.video(
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

  factory NetworkSearchResult.fromJson(Map<String, dynamic> json)
    => _$NetworkSearchResultFromJson(json);
}

class HtmlTitle {
  HtmlTitle(this._title);
  
  factory HtmlTitle.fromJson(String title) => HtmlTitle(title);
  
  final String _title;

  String stripTags() => parse(_title).body?.text ? _title,
  
  @override
  String toString() => _title;
}

@freezed
class NetworkMediaScore with _$NetworkMediaScore{
  const factory NetworkMediaScore(
    int score;
    int userCount;
  ) = _NetworkMediaScore;
  
  factory NetworkMediaScore.fromJson(Map<String, dynamic> json)
    => _$NetworkMediaScoreFromJson(json);
}

@freezed
class NetworkBiliUserRes with _$NetworkBiliUserRes {
  const factory NetworkBiliUserRes(
    int aid,
    String bvid,
    String title,
    int pubdate,
    String arcurl,
    String pic,
    String play,
    int dm,
    int coin,
    int fav,
    String desc,
    String duration,
    int isPay,
    int isUnionVideo,
    int isChargeVideo,
    int vt,
    int enableVt,
    String vtDisplay,
  ) = _NetworkBiliUserRes;
  
  factory NetworkBiliUserRes.fromJson(Map<String, dynamic> json)
    => _$NetworkBiliUserResFromJson(json);
}

