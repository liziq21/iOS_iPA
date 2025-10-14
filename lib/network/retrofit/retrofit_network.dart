import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:f_biuli/network/retrofit/api_call_adapter.dart';
import 'package:f_biuli/network/network_data_source.dart';
import 'package:f_biuli/bili/constonts/.dart';
import 'package:f_biuli/bili/category.dart';
import 'package:f_biuli/bili/date_range.dart';
import 'package:f_biuli/bili/search_type.dart';
import 'package:f_biuli/bili/search_order.dart';
import 'package:f_biuli/bili/user_type.dart';
import 'package:f_biuli/bili/video_duration_filter.dart';
import 'package:f_biuli/model/search/neteork_live_search.dart';
import 'package:f_biuli/model/search/neteork_search.dart';
import 'package:f_biuli/model/search/neteork_search_result_data.dart';
import 'package:f_biuli/model/search/network_search_suggest.dart';
import 'package:f_biuli/model/search/neteork_type_search.dart';
import 'package:f_biuli/utils/result.dart';

part 'retrofit_network.g.dart';

@lazySingleton
@RestApi(callAdapter: ApiCallAdapter)
abstract class BiliNetworkApi {
  
  @factoryMethod
  factory BiliNetworkApi(
    Dio dio, {
    String? baseUrl,
  }) = _BiliNetworkApi;
  
  @GET(ApiPath.search)
  Future<Result<NetworkSearch>> search(
    @Query('keyword') String keyword, {
    @Query('page') int page,
  });
  
  @GET(ApiPath.searchType)
  Future<Result<NetworkTypeSearch>> searchByType(
    @Query('search_type') String searchType,
    @Query('keyword') String keyword, {
    @Query('page') int? page,
    @Query('order') SearchOrder? order,
    @Query('duration') VideoDurationFilter? duration,
    @Query('tids') int? tids,
    @Query('order_sort') int? orderSort,
    @Query('user_type') UserType? userType,
    @Query('category_id') String? categoryId,
    @Query('pubtime_begin_s') int? pubtimeBeginS,
    @Query('pubtime_end_s') int? pubrimeEndS,
  });
  
  @MetaData(main_ver: 'v1')
  @GET(SearchApi.searchSuggest)
  Future<Result<NetworkSearchSuggest>> searchSuggest(
    @Query('term') String term,
    @Query('highlight') String highlight,
  );
}

@lazySingleton
class BilibiliNetworkSearch implements NetworkSearchDataSource {
  const BilibiliNetworkSearch(this.networkApi);
  
  final BiliNetworkApi networkApi;
  
  @override
  Future<Result<NetworkSearch>> search(
    String keyword, {
    String? page,
    }) async => networkApi.search(
    keyword,
    page: page,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchArticle(
    String keyword, {
    int? page,
    ArticleCategory? category,
    ArticleSearchOrder? order,
  }) async =>
    networkApi.searchByType(
      searchType: SearchType.article,
      keyword: keyword,
      page: page,
      order: order,
      categoryId: category,
    );
    
  /*
  @override
  Future<Result<List<NetworkSearch>>> searchBiliUser(
    String keyword, {
    int? page,
    UserSearchOrder? order,
    UserType? userType,
  }) async => networkApi.searchByType(
    searchType: SearchType.biliUser,
    keyword: keyword,
    page: page,
    order: order?.order.toString(),
    orderSort: order?.orderSort?.index,
    userType: userType?.toString(),
  );
  
  @override
  Future<Result<List<NetworkSearchMediaBangumi>>> searchMediaBangumi(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    searchType: SearchType.mediaBangumi,
    keyword: keyword,
    page: page,
  );
  
  @override
  Future<Result<List<NetworkSearchMediaFt>>> searchMediaFt(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    searchType: SearchType.mediaFt,
    keyword: keyword,
    page: page,
  );
  
  @override
  Future<NetworkSearch<NetworkSearchLive>> searchLive(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    searchType: SearchType.live,
    keyword: keyword,
    page: page,
  );
  
  @override
  Future<Result<List<NetworkSearchLiveRoom>>> searchLiveRoom(
    String keyword, {
    int? page,
    LiveRoomSearchOrder? order,
  }) async => networkApi.searchByType(
    searchType: SearchType.liveRoom,
    keyword: keyword,
    page: page,
    order: order?.toString(),
  );
  
  @override
  Future<Result<List<NetworkSearchLiveUser>>> searchLiveUser(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    searchType: SearchType.liveUser,
    keyword: keyword,
    page: page,
  );
  
  @override
  Future<Result<List<NetworkSearchPhoto>>> searchPhoto(
    String keyword, {
    int? page,
    PhotoCategory? category,
    PhotoOrVideoSearchOrder? order,
  }) async => networkApi.searchByType(
    searchType: SearchType.photo,
    keyword: keyword,
    page: page,
    order: order?.toString(),
    categoryId: category?.toString(),
  );
  
  @override
  Future<Result<List<NetworkSearchTopic>>> searchTopic(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    searchType: SearchType.topic,
    keyword: keyword,
    page: page,
  );
  
  @override
  Future<Result<List<NetworkSearchVideo>>> searchVideo(
    String keyword, {
    int? page,
    PhotoOrVideoSearchOrder? order,
    VideoDurationFilter? duration,
    int? tids,
    DateRange? dateRange,
  }) async => networkApi.searchByType(
    searchType: SearchType.video,
    keyword: keyword,
    page: page,
    order: order?.toString(),
    duration: duration,
    tids: tids,
    pubtimeBeginS: DateRange?.start.millisecondsSinceEpoch ~/ 1000,
    pubtimeEndS: DateRange?.end.millisecondsSinceEpoch ~/ 1000,
  );
  */
  @override
  Future<Result<NetworkSearchSuggest>> searchSuggest(String term) async =>
    networkApi.searchSuggest(term, term);
}
