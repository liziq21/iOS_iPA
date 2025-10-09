import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_type.g.dart';

@JsonEnum(valueField: 'type')
enum SearchType {
  article('article'),
  biliUser('bili_user'),
  mediaBangumi('media_bangumi'),
  mediaFt('media_ft'),
  live('live'),
  liveRoom('live_room'),
  liveUser('live_user'),
  photo('photo'),
  topic('topic'),
  video('video');

  const SearchType(this.type);
  final String type;
  
  static bool hasType(String value) {
    return SearchType.values.any((e) => e.type == value);
  }
  
  static SearchType? parseType(String value) {
    for (final searchType in SearchType.values) {
      if (searchType.type == value) {
        return searchType;
      }
    }
    return null;
  }
}
