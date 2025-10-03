import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_search_item.dart';

part 'network_search.freezed.dart';
part 'network_search.g.dart';

@freezed
class NetworkSearch with _$NetworkSearch {
  const factory NetworkSearch(
    int? numResults,
    List<NetworkSearchItem> result,
  ) = _NetworkSearch;

  factory NetworkSearch.fromJson(Map<String, dynamic> json)
    => _$NetworkSearchFromJson(json);
}

