import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../network_data_source.dart';

part 'retrofit_network.g.dart';

@RestApi(baseUrl: 'https://api.bilibili.com')
abstract class RetrofitNetworkApi {
  factory RetrofitNetworkApi(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = RetrofitNetworkApiYmlp;

  @Headers(<String, String>{'Cookie': '{"SESSDATA"="xxx"}'})
  @GET('/x/web-interface/search/all/v2')
  Future<List<Task>> getSearchAll(
    @Query() String keyword,
    @Query() int page, {
    @Query() String? order,
    @Query() int? duration,
    @Query() int? tids,
    @Query('order_sort') int? orderSort,
    @Query('user_type') int? userType,
    @Query('category_id') int? categoryId,
    @Query('pubtime_begin_s') int? pubBegin,
    @Query('pubtime_end_s') int? pubEnd,
  });
  
  @Headers(<String, String>{'Cookie': '{"SESSDATA"="xxx"}'})
  @GET('/x/web-interface/search/type')
  Future<List<Task>> getSearchByType(
    @Query('search_type') String searchType,
    @Query() String keyword,
    @Query() int page, {
    @Query() String? order,
    @Query() int? duration,
    @Query() int? tids,
    @Query('order_sort') int? orderSort,
    @Query('user_type') int? userType,
    @Query('category_id') int? categoryId,
    @Query('pubtime_begin_s') int? pubBegin,
    @Query('pubtime_end_s') int? pubEnd,
  });

  @GET('https://s.search.bilibili.com/main/suggest')
  Future<List<Task>> getSearchSuggest(
    @Query() String term,
    @Query() String highlight, {
    @Query('main_ver') String mainVer: 'v1',
  });

  /*@GET('/tasks')
  Future<List<Task>> getTopicPubSearch(
    @Query() String keywords,
    @Query() String content, {
    @Query('page_size') int? pageSize,
    @Query('page_num') int? pageNum,
    @Query() int? offset,
    @Query('web_location') String webLocation: '333.1365',
  });*/
}

class RetrofitNetwork implements NetworkDataSource {
  const RetrofitNetwork({
    Dio? dio,
  }) : networkApi = RetrofitNetworkApi(dio ?? Dio());
  
  final RetrofitNetworkApi networkApi;
  
  Future<List<NetworkSearch>> getSearchAll({
    String keyword,
    String page, {
    String? order,
    int? duration,
    int? tids,
    int? orderSort,
    int? userType,
    int? categoryId,
    int? pubBegin,
    int? pubEnd,
  }) async => networkApi.getSearchAll(
    keyword,
    page,
    if (order?.isNotEmpty ?? false) 'order': order,
    duration: duration,
    tids: tids,
    orderSort: orderSort,
    userType: userType,
    categoryId: categoryId,
    pubBegin: pubBegin,
    pubEnd: pubEnd,
  );
  
  Future<List<NetworkSearch>> getSearchByType({
    String searchType,
    String keyword, 
    int page, {
    String? order,
    int? duration,
    int? tids,
    int? orderSort,
    int? userType,
    int? categoryId,
    int? pubBegin,
    int? pubEnd,
  }) async => networkApi.getSearchByType(
    searchType,
    keyword,
    page,
    if (order?.isNotEmpty ?? false) order: order,
    duration: duration,
    tids: tids,
    orderSort: orderSort,
    userType: userType,
    categoryId: categoryId,
    pubBegin: pubBegin,
    pubEnd: pubEnd,
  );
  
  Future<NetworkSearchSuggest> getSearchSuggest(String term) async =>
    networkApi.getSearchSuggest(term, term);
  
  /*Future<NetworkTopicPubSearch> getTopicPubSearch({
    required String keywords,
    required int pageNum,
    String content: '',
  }) async {
    return networkApi.getTopicPubSearch(
      keywords,
      content,
      if (pageNum == 1) ...{
        pageSize': 20,
        pageNum': 1,
      } else ...{
        offset: 20 * (pageNum - 1),
      }
    );
  }*/
}
