import 'package:freezed_annotation/freezed_annotation.dart';
import 'network_search_result_data.dart';

part 'network_live_search_result.freezed.dart';
part 'network_live_search_result.g.dart';

@freezed
abstract class NetworkLiveSearchResult with _$NetworkLiveSearchResult {

  const factory NetworkLiveSearchResult(
    //@JsonKey(name: 'live_room')
    List<NetworkSearchLiveRoom>? liveRoom,
    //@JsonKey(name: 'live_user')
    List<NetworkSearchLiveUser>? liveUser,
  ) = _NetworkLiveSearchResult;

  factory NetworkLiveSearchResult.fromJson(Map<String, dynamic> json)
    => _$NetworkLiveSearchResultFromJson(json);
}