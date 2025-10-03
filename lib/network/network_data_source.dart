import 'search/network_search.dart';
import 'search/network_search_by_all.dart';
import 'search/network_search_suggest.dart';

abstract class NetworkDataSource {
  
  Future<List<NetworkSearch>> getSearchAll(
    String keyword,
    int page,
    {
      String order,
      int duration,
      int tids,
      int orderSort,
      int userType,
      int categoryId,
      int pubBegin,
      int pubEnd,
    }
  );
  
  Future<List<NetworkSearchByType>> getSearchByType(
    SearchType searchType,
    String keyword,
    int page,
    {
      String order,
      int duration,
      int tids,
      int orderSort,
      int userType,
      int categoryId,
      int pubBegin,
      int pubEnd,
    }
  );
  
  Future<NetworkSearchSuggest> getSearchSuggest(String term);
  
}