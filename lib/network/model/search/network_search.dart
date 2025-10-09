import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_search_result.dart';

part 'network_search.freezed.dart';
part 'network_search.g.dart';

@freezed
class NetworkSearch with _$NetworkSearch {
  const factory NetworkSearch(
    int? numResults,
    List<NetworkSearchResult> result,
  ) = _NetworkSearch;

  factory NetworkSearch.fromJson(Map<String, dynamic> json)
    => _$NetworkSearchFromJson(json);
}