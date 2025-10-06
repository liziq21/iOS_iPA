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

  const StatusCodeEnhanced(this.type);
  final String type;
}
