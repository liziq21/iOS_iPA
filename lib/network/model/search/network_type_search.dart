import 'package:json_annotation/json_annotation.dart';
import 'network_search_result_data.dart';

part 'network_type_search.g.dart';

@JsonSerializable(createToJson: false)
abstract class NetworkTypeSearch<T> {
  int numResults;
  
  @JsonKey(fromJson: _dataFromJson)
  List<NetworkSearchResultData> result;
  
  const NetworkTypeSearch({this.numResults, this.result});

  factory NetworkTypeSearch.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT
  ) => _$NetworkTypeSearchFromJson(json,fromJsonT);
  
  static List<NetworkSearchResultData> _dataFromJson(Object json) {
    if (json is List<Map<String, dynamic>>) {
      return json.map(NetworkSearchResultData.fromJson)
        .toList();
        //as List<T>;
    }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}
