import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_search_by_type.freezed.dart';
part 'network_search_by_type.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class NetworkSearchByType<T> with _$NetworkSearchByType<T> {
  const factory NetworkSearchByType(
    int? numResults,
    List<T> result,
  ) = _NetworkSearchByType;

  factory NetworkSearchByType.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT
  ) => _$NetworkSearchByTypeFromJson(json,fromJsonT);
}
