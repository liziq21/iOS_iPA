import 'package:freezed_annotation/freezed_annotation.dart';
import '../../bili/search_type.dart';
import 'network_search_result_data.dart';

part 'network_search_result.freezed.dart';
part 'network_search_result.g.dart';

@freezed
abstract class NetworkSearchResult _$NetworkSearchResult {
  
  const NetworkSearchResult(
    String resultType,
    List<NetworkSearchResultData> data,
  ) _NetworkSearchResult;
  
  const factory NetworkSearchResult.fromJson(Map<String, dynamic> json)
    => _$NetworkSearchResultFromJson(json);
  
}
