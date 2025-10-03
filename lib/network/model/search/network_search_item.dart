import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart' show parse;
import 'package:json_annotation/json_annotation.dart';
import '../user/network_user_official_verify.dart'
import 'html_title.dart';

part 'network_search_items.freezed.dart';
part 'network_search_items.g.dart';

import augment 'network_search_items/network_search_article_item.dart';
import augment 'network_search_items/network_search_pgc_item.dart';
import augment 'network_search_items/network_search_live_item.dart';
import augment 'network_search_items/network_search_user_item.dart';
import augment 'network_search_items/network_search_video_item.dart';

@Freezed(unionKey: 'result_type')
sealed class NetworkSearchItem with _$NetworkSearchItem {
  factory NetworkSearchItem.fromJson(Map<String, dynamic> json) =>
    _$NetworkSearchItemFromJson(json)
}

class HtmlTitle{
  HtmlTitle(this._title);
  
  factory HtmlTitle.fromJson(String title) => HtmlTitle(title);
  
  final String _title()

  String stripTags() => parse(_title).body?.text ?? _title;

  @override
  String toString() => _title;
}