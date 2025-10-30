import 'package:f_biuli/bili/search_result_type.dart';
import 'package:f_biuli/network/model/search/network_search.dart';
import 'package:f_biuli/network/model/search/network_search_result.dart';
import 'package:f_biuli/network/model/user/network_user_official_verify.dart';

const networkSearch = NetworkSearch(
  1,
  20,
  1000,
  50,
  pageinfo,
  {
    SearchResultType.article: [networkArticleSearchResult],
    SearchResultType.biliUser: [networkBiliUserSearchResult],
    SearchResultType.mediaBangumi: [networkMediaBangumiSearchResult],
    SearchResultType.mediaFt: [networkMediaFtSearchResult],
    SearchResultType.liveRoom: [networkLiveRoomSearchResult],
    SearchResultType.liveUser: [networkLiveUserSearchResult],
    SearchResultType.video: [networkVideoSearchResult],
  },
)

const networkLiveSearch = NetworkSearch(
  1,
  20,
  1000,
  50,
  pageinfoByLive,
  {
    SearchResultType.liveRoom: [networkLiveRoomSearchResult],
    SearchResultType.liveUser: null,
  },
)

const networkTypeSearch = NetworkSearch(
  1,
  20,
  1000,
  50,
  null,
  {
    SearchResultType.article: [networkArticleSearchResult],
  },
)

const pageinfo = {
    SearchResultType.parse('article'): 
      NetworkPageinfo(
        total: 0,
        numResults: 0,
        pages: 0
      ),
    SearchResultType.parse('bili_user'): 
      NetworkPageinfo(
        total: 0,
        numResults: 0,
        pages: 0
      ),
    SearchResultType.parse('media_bangumi'): 
      NetworkPageinfo(
        total: 0,
        numResults: 0,
        pages: 0
      ),
    SearchResultType.parse('media_ft'): 
      NetworkPageinfo(
        total: 0,
        numResults: 0,
        pages: 0
      ),
    SearchResultType.parse('live_room'): 
      NetworkPageinfo(
        total: 0,
        numResults: 0,
        pages: 0
      ),
    SearchResultType.parse('live_user'): 
      NetworkPageinfo(
        total: 0,
        numResults: 0,
        pages: 0
      ),
    SearchResultType.parse('video'): 
      NetworkPageinfo(
        total: 1000,
        numResults: 1000,
        pages: 50
      ),
};

const pageinfoByLive = {
    SearchResultType.parse('live_room'): 
      NetworkPageinfo(
        total: 1000,
        numResults: 1000,
        pages: 167,
      ),
    SearchResultType.parse('live_user'): 
      NetworkPageinfo(
        total: 745,
        numResults: 745,
        pages: 19,
      ),
};

const networkArticleSearchResult = NetworkArticleSearchResult(
  SearchResultType.parse('article'),
  26,
  '数码',
  '',
  '',
  21014304,
  [
    '//i1.hdslb.com/bfs/article/e138e2d536aef424cd939c776e06d46d2a17fbfb.png'
  ],
  0,
  false,
  false,
  24,
  29184220,
  1672983906,
  7,
  6,
  2,
  0,
  0,
  4,
  HtmlTitle('在线免费<em class=\"keyword\">看</em>电影的网站哪个好？这两个影视网站绝对是最佳推荐'),
  '',
  10167,
);

const networkBiliUserSearchResult = NetworkBiliUserSearchResult(
  SearchResultType.parse('bili_user'),
  451320374,
  '央视网快看',
  '在这里，看见世界。合作投稿请私信~',
  2159677,
  10220,
  '//i1.hdslb.com/bfs/face/127e4c355254788f41ce3dd493f1f2925ebd423d.jpg',
  0,
  0,
  '',
  6,
  3,
  1,
  1,
  22142427,
  [
    NetworkBiliUserRes(
      115410686975318,
      'BV1o6WQzJEb7',
      '高市早苗将出任日本第104任首相',
      1761027453,
      'http://www.bilibili.com/video/av115410686975318',
      '//i2.hdslb.com/bfs/archive/188384365da6e5a7ba53541f2dc7638b7f88ca79.jpg',
      '17747',
      5,
      18,
      72,
      '10月21日，在日本众议院首相指名选举第一轮投票中，自民党总裁高市早苗获得237票（众议院共465个议席），超过半数票获胜，将确定出任日本第104任首相。',
      '0:30',
      0,
      0,
      0,
      0,
      0,
      ''
    ),
  ],
  NetworkUserOfficialVerify(
    1,
    '央视网新闻频道官方账号',
  ),
  0,
);

const networkMediaBangumiSearchResult = NetworkMediaBangumiSearchResult(
  SearchResultType.parse('media_bangumi'),
  28234651,
  HtmlTitle('嗨，顾得白之爱<em class=\"keyword\">最</em>珍贵'),
  '',
  4,
  '亚琳\n杨静\n新月\n小K',
  '总编辑：沈丹冶\n总导演：沈丹怡\n出品人：姚林\n编剧：任重驰、王周愔\n配音导演：亚琳',
  38959,
  false,
  '',
  4,
  '国创',
  'https://www.bilibili.com/bangumi/play/ss38959',
  '立即观看',
  0,
  null,
  'http://i0.hdslb.com/bfs/bangumi/image/6b3d6a9b53652a28c9f0a0463103ae59cccd6174.png',
  '中国大陆',
  ',
  'https://www.bilibili.com/bangumi/play/ss38959',
  '新学期，顾得白走进幼儿园，和同学们分享暑假趣事。聊天过程中，他了解到随便打断别人说话是不礼貌的行为。幼儿园的生活总会有小摩擦，顾得白和好朋友球球闹矛盾了，在妈妈的开导下，顾得白懂得了友谊可贵的道理。一...',
  1546272000,
  2,
  "",
  NetworkMediaScore(
    0,
    0,
  ),
  '全80话',
);

const networkMediaFtSearchResult = NetworkMediaFtSearchResult(
  SearchResultType.parse('media_ft'),
  22663696,
  HtmlTitle('地平线：宇宙中的怪异天气'),
  'Horizon: The Weirdest Weather In The Universe',
  3,
  '',
  'BBC Worldwide Limited',
  26798,
  false,
  '',
  3,
  '纪录片',
  'https://www.bilibili.com/bangumi/play/ep265146',
  '立即观看',
  0,
  'http://i0.hdslb.com/bfs/bangumi/285aded5faa04401b8c3135496b84e76d6cb75ca.jpg',
  '英国',
  '宇宙/自然/科技',
  'https://www.bilibili.com/bangumi/play/ep265146',
  '从保龄球大小的冰雹到扭曲的龙卷风，地球上的天气可以说是无奇不有，但即使是我们见过的最极端的天气也无法和太阳系其他行星或宇宙中数百万光年以外的行星上的天气相比。通过参观先进的实验室和使用神奇的CGI图像...',
  1451577600,
  1,
  NetworkMediaScore(
    0,
    0
  ),
  '',
);

const networkLiveRoomSearchResult = NetworkLiveRoomSearchResult(
  SearchResultType.parse('live_room'),
  3,
  240820,
  '守望先锋',
  '//i0.hdslb.com/bfs/live-key-frame/keyframe1012190100002128102089i7ja.jpg',
  0,
  1,
  '2025-10-12 15:32:24',
  15658,
  1,
  0,
  21281020,
  0,
  1,
  '守望先锋,美少女,解说,小姐姐'
  HtmlTitle('先<em class=\"keyword\">看</em>韩再<em class=\"keyword\">看</em>中'),
  '//i1.hdslb.com/bfs/face/48a292a34f391b935bd76c69761e17ed9d019d68.jpg',
  1779128,
  '小霜请你吃颗糖',
  '//i0.hdslb.com/bfs/live/new_room_cover/5411343a34b96b91f57aa4d2561301269aa94fa7.jpg',
);

const networkLiveUserSearchResult = NetworkLiveUserSearchResult(
  SearchResultType.parse('live_user'),
  6,
  715,
  2163958,
  '时政',
  22142427,
  true,
  1,
  '2025-09-30 10:34:13',
  1,
  0,
  22142427,
  '',
  '//i1.hdslb.com/bfs/face/127e4c355254788f41ce3dd493f1f2925ebd423d.jpg',
  451320374,
  '央视网快<em class=\'keyword\">看</em>",
);

const networkVideoSearchResult = NetworkVideoSearchResult(
  SearchResultType.parse('video'),
  114179860077362,
  '阿周说事',
  215998368,
  '95',
  '数码',
  'http://www.bilibili.com/video/av114179860077362',
  114179860077362,
  'BV1LoXgYFEQu',
  HtmlTitle('<em class=\"keyword\">ZUI</em>系统刷成类原生安卓教程'),
  '原帖链接https://xdaforums.com/t/tb-q706f-pad-pro-12-6-bypass-lenovos-region-lock-row-zui-easy.4487871/\nHXD的提取码6je7，链接https://www.lanzouj.com/b389297\n系统包下载链接https://mirrors-obs-1.lolinet.com/firmware/lenowow/2021/Tab_P12_Pro/TB-Q706F/\n9008线刷工具https://www.yhcre',
  '//i1.hdslb.com/bfs/archive/42cb9a7dad4e8655b6f69283a0edf2633e740c26.jpg',
  6545,
  189,
  'ZUI,GOOGLE,刷机,安卓系统,区域限制,类原生,必剪创作,QFIL,P12 PRO,小新pad pro12.6'
  28,
  1742256000,
  1742256021,
  '6:16',
  false,
  0,
  120,
  'https://i0.hdslb.com/bfs/face/55424210b215ee87c5e561f6c870533cb80e71fe.jpg',
  '',
  '',
  '',
  '',
  0,
);