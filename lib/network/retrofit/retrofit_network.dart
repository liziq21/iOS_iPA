import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:f_biuli/bili/constonts/uris.dart';
import 'package:f_biuli/bili/category.dart';
import 'package:f_biuli/bili/date_range.dart';
import 'package:f_biuli/bili/search_type.dart';
import 'package:f_biuli/bili/search_order.dart';
import 'package:f_biuli/bili/user_type.dart';
import 'package:f_biuli/bili/video_duration_filter.dart';
import 'package:f_biuli/network/model/search/network_live_search.dart';
import 'package:f_biuli/network/model/search/network_search.dart';
import 'package:f_biuli/network/model/search/network_search_result_data.dart';
import 'package:f_biuli/network/model/search/network_search_suggest.dart';
import 'package:f_biuli/network/model/search/network_type_search.dart';
import 'package:f_biuli/utils/result.dart';

part 'retrofit_network.g.dart';

@lazySingleton
@RestApi(callAdapter: ApiCallAdapter)
abstract class BiliNetworkApi {
  
  @factoryMethod
  factory BiliNetworkApi(
    Dio dio, {
    @Named("apiBase") String? baseUrl,
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
  
  @GET(SearchApi.searchSuggest)
  Future<Result<NetworkSearchSuggest>> searchSuggest(
    @Query('term') String term,
    @Query('highlight') String highlight, [
    @Query('main_ver') String mainVer = 'v1',
  ]);
}

@lazySingleton
class BiliNetworkSearch implements NetworkSearchDataSource {
  const BiliNetworkSearch(this.networkApi);
  
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
      SearchType.article,
      keyword,
      page: page,
      order: order,
      categoryId: category,
    );
    
  
  @override
  Future<Result<NetworkTypeSearch>> searchBiliUser(
    String keyword, {
    int? page,
    UserSearchOrder? order,
    UserType? userType,
  }) async => networkApi.searchByType(
    SearchType.biliUser,
    keyword,
    page: page,
    order: order,
    orderSort: order,
    userType: userType,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchMediaBangumi(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    SearchType.mediaBangumi,
    keyword,
    page: page,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchMediaFt(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    SearchType.mediaFt,
    keyword,
    page: page,
  );
  
  @override
  Future<Result<tworkTypeSearch>> searchLive(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    SearchType.live,
    keyword,
    page: page,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchLiveRoom(
    String keyword, {
    int? page,
    LiveRoomSearchOrder? order,
  }) async => networkApi.searchByType(
    SearchType.liveRoom,
    keyword,
    page: page,
    order: order,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchLiveUser(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    SearchType.liveUser,
    keyword,
    page: page,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchPhoto(
    String keyword, {
    int? page,
    PhotoCategory? category,
    PhotoOrVideoSearchOrder? order,
  }) async => networkApi.searchByType(
    SearchType.photo,
    keyword,
    page: page,
    order: order,
    categoryId: category,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchTopic(
    String keyword, {
    int? page,
  }) async => networkApi.searchByType(
    SearchType.topic,
    keyword,
    page: page,
  );
  
  @override
  Future<Result<NetworkTypeSearch>> searchVideo(
    String keyword, {
    int? page,
    PhotoOrVideoSearchOrder? order,
    VideoDurationFilter? duration,
    int? tids,
    DateRange? dateRange,
  }) async => networkApi.searchByType(
    SearchType.video,
    keyword,
    page: page,
    order: order,
    duration: duration,
    tids: tids,
    pubtimeBeginS: DateRange?.start.millisecondsSinceEpoch ~/ 1000,
    pubtimeEndS: DateRange?.end.millisecondsSinceEpoch ~/ 1000,
  );
  
  @override
  Future<Result<NetworkSearchSuggest>> searchSuggest(String term) async =>
    networkApi.searchSuggest(term, term);
}
