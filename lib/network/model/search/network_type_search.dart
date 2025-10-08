import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_type_search_.freezed.dart';
part 'network_type_search.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class NetworkTypeSearch<T> with _$NetworkTypeSearch<T> {
  const factory NetworkTypeSearch(
    int? numResults,
    List<T> result,
  ) = _NetworkTypeSearch;

  factory NetworkTypeSearch.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT
  ) => _$NetworkTypeSearchFromJson(json,fromJsonT);
}
