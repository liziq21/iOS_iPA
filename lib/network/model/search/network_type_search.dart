import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../bili/search_type.dart';
import 'network_search_result_data.dart';

part 'network_type_search.freezed.dart';
part 'network_type_search.g.dart';

@freezed
abstract class NetworkTypeSearch<T> with _$NetworkTypeSearch {
  const NetworkTypeSearch(
    int numResults,
    @JsonKey(fromJson: _resultFromJson)
    T result,
  ) = _NetworkTypeSearch;

  const factory NetworkTypeSearch.fromJson(
    Map<String, dynamic> json,
  ) => _$NetworkTypeSearchFromJson(json);
}

static T _resultFromJson<T>(Object json) {
  if (json is Map<String, dynamic>) {
    return NetworkLiveSearchResult.fromJson(json) as T;
  } else if (json is List) {
    return json
      .map((e) => NetworkSearchResultData.fromJson(e as Map<String, dynamic>))
      .toList()
      as T;
  }
  throw ArgumentError.value(
    json,
    'json',
    'Cannot convert the provided data.',
  );
}