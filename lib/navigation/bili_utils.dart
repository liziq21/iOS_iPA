import '../network/utils/uri_extensions.dart';
import 'route_path.dart';

class BiliUtils {
  static String? getRoutePath(Uri uri) async {
    if (!uri.isHTTPScheme) {
      if (!uri.isScheme('bilibili')) {
        throw Exception('Scheme is ' + uri.scheme + ': error');
      }
      return null;
    }
    
    //uri = await uri.getFinalUrl();
    
    var secondLevelDomain = uri.secondLevelDomain;
    if (secondLevelDomain case 'www' || '') {
      return null;
    }
    
    return switch (secondLevelDomain) {
      RoutePath.live || RoutePath.search ||
      RoutePath.space => '/$secondLevelDomain/${uri.lastSegdment}',
      _ => null,
    };
  }
}