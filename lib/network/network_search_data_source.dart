import '../bili/category.dart.dart';
import '../bili/date_range.dart';
import '../bili/search_type.dart';
import '../bili/search_order.dart';
import '../bili/user_type.dart';
import '../bili/video_duration_filter.dart';
import 'model/search/neteork_search.dart'
import 'model/search/neteork_search_item.dart'
import 'model/search/neteork_search_article.dart'
import 'search/network_search.dart';
import 'search/network_search_by_all.dart';
import 'search/network_search_suggest.dart';

abstract interface class NetworkSearchDataSource {
  
  Future<NetworkSearch> getSearch(
    String keyword, {
    int? page,
  });
  
  Future<NetworkSearch<NetworkSearchArticle>> getSearchArticle(
    String keyword, {
    int? page,
    ArticleCategory? category,
    ArticleSearchOrder? order,
  });
  
  Future<NetworkSearch<NetworkSearch>> getSearchBiliUser(
    String keyword, {
    int? page,
    UserSearchOrder? order,
    UserType? userType,
  });
  
  Future<NetworkSearch<NetworkSearchMediaBangumi>> getSearchMediaBangumi(
    String keyword, {
    int? page,
  });
  
  Future<NetworkSearch<NetworkSearchMediaFt>> getSearchMediaFt(
    String keyword, {
    int? page,
  });
  
  Future<NetworkSearch<NetworkSearchLive>> getSearchLive(
    String keyword, {
    int? page,
  });
  
  Future<NetworkSearch<NetworkSearchLiveRoom>> getSearchLiveRoom(
    String keyword, {
    int? page,
    LiveRoomSearchOrder? order,
  });
  
  Future<NetworkSearch<NetworkSearchLiveUser>> getSearchLiveUser(
    String keyword, {
    int? page,
  });
  
  Future<NetworkSearch<NetworkSearchPhoto>> getSearchPhoto(
    String keyword, {
    int? page,
    PhotoCategory? category,
    PhotoOrVideoSearchOrder? order,
  });
  
  Future<NetworkSearch<NetworkSearchTopic>> getSearchTopic(
    String keyword, {
    int? page,
  });
  
  Future<NetworkSearch<NetworkSearchVideo>> getSearchVideo(
    String keyword, {
    int? page,
    PhotoOrVideoSearchOrder? order,
    VideoDurationFilter? duration,
    int? tids,
    DateRange? dateRange
  });
  
  Future<NetworkSearchSuggest> getSearchSuggest(String term);
  
}