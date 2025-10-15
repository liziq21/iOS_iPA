import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_search_result.dart';

part 'network_search.freezed.dart';
part 'network_search.g.dart';

@freezed
abstract class NetworkSearch with _$NetworkSearch {
  const factory NetworkSearch(
    int? nums,
    @JsonKey(fromJson: NetworkSearchResult.fromJson)
    NetworkSearchResult result,
  ) = _NetworkSearch;

  factory NetworkSearch.fromJson(Map<String, dynamic> json)
    => _$NetworkSearchFromJson(json);
}

@freezed
abstract class NetworkTypeSearch with _$NetworkTypeSearch {
  const factory NetworkTypeSearch(
    int numResults,
    @JsonKey(fromJson: NetworkSearchResult.fromJson)
    NetworkSearchResult result,
  ) = _NetworkTypeSearch;

  factory NetworkTypeSearch.fromJson(Map<String, dynamic> json)
    => _$NetworkTypeSearchFromJson(json);
}


