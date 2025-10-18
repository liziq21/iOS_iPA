import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:f_biuli/bili/search_type.dart';
//import 'package:f_biuli/utils/json_factory.dart';
import 'network_type_search_result.dart';

part 'network_search_result.freezed.dart';
//part 'network_search_result.g.dart';

@freezed
abstract class NetworkSearchResult with _$NetworkSearchResult {
  const factory NetworkSearchResult(
    List<NetworkUnSearchResult>? un,
    List<NetworkArticleSearchResult>? article,
    List<NetworkLiveRoomSearchResult>? liveRoom,
    List<NetworkLiveUserSearchResult>? liveUser,
  ) = _NetworkSearchResult;
  
  static NetworkSearchResult fromJson(Object json) {
    List<NetworkUnSearchResult>? un;
    List<NetworkArticleSearchResult>? article;
    List<NetworkLiveRoomSearchResult>? liveRoom;
    List<NetworkLiveUserSearchResult>? liveUser;
  
    void _assignResult(List? dataList) {
      if (dataList == null || dataList.isEmpty) return;

      final type = (dataList[0]! as Map<String, dynamic>)['type'];
      switch (SearchType.parse(type)) {
        case SearchType.article:
          article = _parseList<NetworkArticleSearchResult>(dataList, NetworkArticleSearchResult.fromJson);
        case SearchType.liveRoom:
          liveRoom = _parseList<NetworkLiveRoomSearchResult>(dataList, NetworkLiveRoomSearchResult.fromJson);
        case SearchType.liveUser:
          liveUser = _parseList<NetworkLiveUserSearchResult>(dataList, NetworkLiveUserSearchResult.fromJson);
        default:
          un = _parseList<NetworkUnSearchResult>(dataList, NetworkUnSearchResult.fromJson);
      }
    }
    
    // 搜索类型为 live
    if (json is Map<String, dynamic>) {
      liveRoom = _parseList<NetworkLiveRoomSearchResult>(json['live_room'] as List?, NetworkLiveRoomSearchResult.fromJson);
      liveUser = _parseList<NetworkLiveUserSearchResult>(json['live_user'] as List?, NetworkLiveUserSearchResult.fromJson);
    } else if (json is List) {
      
      // 综合搜索
      if ((json[0] as Map<String, dynamic>).containsKey('result_type')) {
        for (var e in json) {
          _assignResult((e as Map<String, dynamic>)['data'] as List?);
        }
        
      // 搜索类型为其它
      } else {
        _assignResult(json);
      }
    } else {
      throw ArgumentError.value(json, 'json', 'Cannot convert the provided data.');
    }
  
    return NetworkSearchResult(un, article, liveRoom, liveUser);
  }
  
  static List<T> _parseList<T>(List? list, T Function(Map<String, dynamic>) fromJson) {
    if (dataList == null || dataList.isEmpty) return [];
    
    return list.map((e) =>
        fromJson(e as Map<String, dynamic>)
    ).whereType<T>().toList();
  }
}

