import '../bili/category.dart.dart';
import '../bili/date_range.dart';
import '../bili/search_type.dart';
import '../bili/search_order.dart';
import '../bili/user_type.dart';
import '../bili/video_duration_filter.dart';
import 'model/search/neteork_search.dart'
import 'model/search/neteork_type_search.dart'
import 'model/search/neteork_search_item.dart'
import 'model/search/network_search_suggest.dart';
import 'utils/result.dart';

abstract interface class NetworkSearchDataSource {
  
  Future<Result<NetworkSearch>> getSearch(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchArticle>>> getSearchArticle(
    String keyword, {
    int? page,
    ArticleCategory? category,
    ArticleSearchOrder? order,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearch>>> getSearchBiliUser(
    String keyword, {
    int? page,
    UserSearchOrder? order,
    UserType? userType,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchMediaBangumi>>> getSearchMediaBangumi(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchMediaFt>>> getSearchMediaFt(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchLive>>> getSearchLive(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchLiveRoom>>> getSearchLiveRoom(
    String keyword, {
    int? page,
    LiveRoomSearchOrder? order,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchLiveUser>>> getSearchLiveUser(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchPhoto>>> getSearchPhoto(
    String keyword, {
    int? page,
    PhotoCategory? category,
    PhotoOrVideoSearchOrder? order,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchTopic>>> getSearchTopic(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch<NetworkSearchVideo>>> getSearchVideo(
    String keyword, {
    int? page,
    PhotoOrVideoSearchOrder? order,
    VideoDurationFilter? duration,
    int? tids,
    DateRange? dateRange
  });
  
  Future<Result<NetworkSearchSuggest>> getSearchSuggest(String term);
  
}