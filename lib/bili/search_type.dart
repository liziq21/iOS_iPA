import 'package:json_annotation/json_annotation.dart';

part 'search_type.g.dart';

//@JsonEnum()
enum SearchType {
  article,
  biliUser,
  mediaBangumi,
  mediaFt,
  live,
  liveRoom,
  liveUser,
  photo,
  topic,
  video
  /*
  static bool hasType(String value) {
    return SearchType.values.any((e) => e.type == value);
  }
  
  static SearchType? parse(String value) {
    for (final searchType in SearchType.values) {
      if (searchType.type == value) {
        return searchType;
      }
    }
    return null;
  }*/
}
