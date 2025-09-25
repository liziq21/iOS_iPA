import '../network/utils/uri_extensions.dart';
import 'route_path.dart';

class BiliUtils {
  static String? getRoutePath(Uri uri) {
    if (!uri.isHTTPScheme) {
      if (!uri.isScheme('bilibili')) {
        throw Exception('Scheme is ${uri.scheme}: error');
      }
      return uri.toString().substring(10);
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