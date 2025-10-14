import '../bili/category.dart';
import '../bili/date_range.dart';
import '../bili/search_type.dart';
import '../bili/search_order.dart';
import '../bili/user_type.dart';
import '../bili/video_duration_filter.dart';
import '../model/search/neteork_live_search.dart';
import '../model/search/neteork_search.dart';
import '../model/search/neteork_search_result_data.dart';
import '../model/search/network_search_suggest.dart';
import '../model/search/neteork_type_search.dart';
import '../utils/result.dart';

import 'utils/result.dart';

abstract interface class NetworkSearchDataSource {
  
  Future<Result<NetworkSearch>> search(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch>> searchArticle(
    String keyword, {
    int? page,
    ArticleCategory? category,
    ArticleSearchOrder? order,
  });
  
  Future<Result<NetworkTypeSearch>> searchBiliUser(
    String keyword, {
    int? page,
    UserSearchOrder? order,
    UserType? userType,
  });
  
  Future<Result<NetworkTypeSearch>> searchMediaBangumi(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch>> searchMediaFt(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch>> searchLive(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch>> searchLiveRoom(
    String keyword, {
    int? page,
    LiveRoomSearchOrder? order,
  });
  
  Future<Result<NetworkTypeSearch>> searchLiveUser(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch>> searchPhoto(
    String keyword, {
    int? page,
    PhotoCategory? category,
    PhotoOrVideoSearchOrder? order,
  });
  
  Future<Result<NetworkTypeSearch>> searchTopic(
    String keyword, {
    int? page,
  });
  
  Future<Result<NetworkTypeSearch>> searchVideo(
    String keyword, {
    int? page,
    PhotoOrVideoSearchOrder? order,
    VideoDurationFilter? duration,
    int? tids,
    DateRange? dateRange
  });
  
  Future<Result<NetworkSearchSuggest>> searchSuggest(String term);
  
}