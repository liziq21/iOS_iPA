import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../bili/category.dart.dart';
import '../bili/date_range.dart';
import '../bili/search_type.dart';
import '../bili/search_order.dart';
import '../bili/user_type.dart';
import '../bili/video_duration_filter.dart';
import '../network_data_source.dart';
import 'api_call_adapter.dart';
import 'model/search/neteork_live_search.dart';
import 'model/search/neteork_search.dart';
import 'model/search/neteork_search_result_data.dart';
import 'model/search/network_search_suggest.dart';
import 'model/search/neteork_type_search.dart';
import 'utils/result.dart';

part 'retrofit_network.g.dart';

@RestApi(baseUrl: 'https://api.bilibili.com', callAdapter: ApiCallAdapter)
abstract class RetrofitNetworkApi {
  factory RetrofitNetworkApi(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = RetrofitNetworkApiYmlp;

  @GET('/x/web-interface/search/all/v2')
  @Headers({'Cookie': '{"SESSDATA"="xxx"}'})
  Future<List<Task>> getSearchAll(
    @Query() String keyword, {
    @Query() int page,
  });
  
  @Headers(<String, String>{'Cookie': '{"SESSDATA"="xxx"}'})
  @GET('/x/web-interface/search/type')
  Future<List<Task>> getSearchByType(
    @Query('search_type') String searchType,
    @Query() String keyword, {
    @Query() int? page,
    @Query() SearchOrder? order,
    @Query() VideoDurationFilter? duration,
    @Query() int? tids,
    @Query('order_sort') int? orderSort,
    @Query('user_type') UserType? userType,
    @Query('category_id') String? categoryId,
    @Query('pubtime_begin_s') int? pubtimeBeginS,
    @Query('pubtime_end_s') int? pubrimeEndS,
  });

  @MetaData(main_ver: 'v1')
  @GET('https://s.search.bilibili.com/main/suggest')
  Future<List<Task>> getSearchSuggest(
    @Query() String term,
    @Query() String highlight,
  );
}

class BilibiliNetworkSearch implements NetworkSearchDataSource {
  const BilibiliNetworkSearch({
    Dio? dio,
  }) : networkApi = RetrofitNetworkApi(dio ?? Dio());
  
  final RetrofitNetworkApi networkApi;
  
  Future<List<NetworkSearch>> getSearchAll(
    String keyword, { String? page, }
  ) async => networkApi.getSearchAll(
    keyword,
    page: page,
  );
  
  Future<NetworkSearch<NetworkSearchArticle>> getSearchArticle(
    String keyword, {
    int? page,
    ArticleCategory? category,
    ArticleSearchOrder? order,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.article,
    keyword: keyword,
    page: page,
    order: order?.toString(),
    categoryId: category?.toString(),
  );
  
  Future<NetworkSearch<NetworkSearch>> getSearchBiliUser(
    String keyword, {
    int? page,
    UserSearchOrder? order,
    UserType? userType,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.biliUser,
    keyword: keyword,
    page: page,
    order: order?.order.toString(),
    orderSort: order?.orderSort?.index,
    userType: userType?.toString(),
  );
  
  Future<NetworkSearch<NetworkSearchMediaBangumi>> getSearchMediaBangumi(
    String keyword, {
    int? page,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.mediaBangumi,
    keyword: keyword,
    page: page,
  );
  
  Future<NetworkSearch<NetworkSearchMediaFt>> getSearchMediaFt(
    String keyword, {
    int? page,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.mediaFt,
    keyword: keyword,
    page: page,
  );
  
  Future<NetworkSearch<NetworkSearchLive>> getSearchLive(
    String keyword, {
    int? page,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.live,
    keyword: keyword,
    page: page,
  );
  
  Future<NetworkSearch<NetworkSearchLiveRoom>> getSearchLiveRoom(
    String keyword, {
    int? page,
    LiveRoomSearchOrder? order,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.liveRoom,
    keyword: keyword,
    page: page,
    order: order?.toString(),
  );
  
  Future<NetworkSearch<NetworkSearchLiveUser>> getSearchLiveUser(
    String keyword, {
    int? page,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.liveUser,
    keyword: keyword,
    page: page,
  );
  
  Future<NetworkSearch<NetworkSearchPhoto>> getSearchPhoto(
    String keyword, {
    int? page,
    PhotoCategory? category,
    PhotoOrVideoSearchOrder? order,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.photo,
    keyword: keyword,
    page: page,
    order: order?.toString(),
    categoryId: category?.toString(),
  );
  
  Future<NetworkSearch<NetworkSearchTopic>> getSearchTopic(
    String keyword, {
    int? page,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.topic,
    keyword: keyword,
    page: page,
  );
  
  Future<NetworkSearch<NetworkSearchVideo>> getSearchVideo(
    String keyword, {
    int? page,
    PhotoOrVideoSearchOrder? order,
    VideoDurationFilter? duration,
    int? tids,
    DateRange? dateRange,
  }) async => networkApi.getSearchByType(
    searchType: SearchType.video,
    keyword: keyword,
    page: page,
    order: order?.toString(),
    duration: duration,
    tids: tids,
    pubtimeBeginS: DateRange?.start.millisecondsSinceEpoch ~/ 1000,
    pubtimeEndS: DateRange?.end.millisecondsSinceEpoch ~/ 1000,
  );
  
  Future<NetworkSearchSuggest> getSearchSuggest(String term) async =>
    networkApi.getSearchSuggest(term, term);
}
