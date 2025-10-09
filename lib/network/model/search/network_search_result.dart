import 'package:json_annotation/json_annotation.dart';

part 'network_search_result.freezed.dart';
part 'network_search_result.g.dart';

@JsonSerializable(createToJson: false)
class NetworkSearchResult {
  String resultType;
  
  @JsonKey(fromJson: _dataFromJson)
  List<NetworkSearchResultData> data;
  
  const NetworkSearchResult({this.resultType, this.data});
  
  factory NetworkTypeSearchResult.fromJson(Map<String, dynamic> json)
    => _$NetworkTypeSearchResultFromJson(json);
  
  static NetworkTypeSearchResult _dataFromJson(Object json) {
    if ([json['result_type'], json['data']]
      case [String type, List<Map<String, dynamic>> data]
    ) {
      return NetworkTypeSearchResult(
        resultType: type,
        data: data.map(NetworkSearchResultData.fromJson).toList(),
      );
    }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}
