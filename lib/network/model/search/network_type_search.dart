import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_search_result_data.dart';

part 'network_type_search.freezed.dart';
part 'network_type_search.g.dart';

@freezed
abstract class NetworkTypeSearch with _$NetworkTypeSearch {
  const NetworkTypeSearch(
    int numResults,
    List<NetworkSearchResultData> result,
  ) = _NetworkTypeSearch;

  const factory NetworkTypeSearch.fromJson(Map<String, dynamic> json)
    => _$NetworkTypeSearchFromJson(json);
}
