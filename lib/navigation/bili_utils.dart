import '../network/utils/uri_extensions.dart';
import 'route_path.dart';

class BiliUtils {
  static Future<String?> httpToRoutePath(Uri uri) async {
    if (!uri.isHTTPScheme) {
      if (!uri.isScheme('bilibili')) {
        throw Exception('Scheme is ' + uri.scheme + ': error');
      }
      return null;
    }
    
    uri = await uri.getFinalUrl();
    
    var secondLevelDomain = uri.secondLevelDomain;
    if (secondLevelDomain case 'www' || '') {
      return null;
    } else {
      return switch (secondLevelDomain) {
        RoutePath.live || RoutePath.search ||
        RoutePath.space => '/$secondLevelDomain/${uri.lastSegdment}',
        _ => RoutePath.home;
      };
    }
  }
}