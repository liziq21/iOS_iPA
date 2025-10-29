import 'package:json_annotation/json_annotation.dart';

part 'search_type.g.dart';

@JsonEnum(alwaysCreate: true, fieldRename: FieldRename.snake)
enum SearchType {
  article,
  biliUser,
  mediaBangumi,
  mediaFt,
  live,
  liveRoom,
  liveUser,
  video;
  
  /*static SearchType? parse(String type) =>
    $enumDecodeNullable(
      _$SearchTypeEnumMap,
      type,
      unknownValue: JsonKey.nullForUndefinedEnumValue,
    );*/
}

@JsonEnum(alwaysCreate: true, fieldRename: FieldRename.snake)
enum SearchResultType {
  article,
  biliUser,
  mediaBangumi,
  mediaFt,
  liveRoom,
  liveUser,
  video,
  un;
  
  static SearchResultType parse(String type) =>
    $enumDecode(
      _$SearchResultTypeEnumMap,
      type,
      unknownValue: SearchResultType.un,
    );
}
