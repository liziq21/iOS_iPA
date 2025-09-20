import '../network/utils/UriExtensions.dart';
import 'route_paths.dart'

class BiliUtils {
  static Future<String?> httpToRoutePath(Uri uri) async {
    if (!uri.isHTTPScheme) {
      if (uri.scheme != 'bilibili') {
        throw Exception('Scheme is ' + Uri.Scheme + ': error');
      }
      return null;
    }
    
    uri = await uri.getFinalUrl();
    
    var secondLevelDomain = uri.secondLevelDomain;
    if (secondLevelDomain case 'www' || '') {
      return null;
    } else {
      final routePath = RoutePaths.fromPath(secondLevelDomain);
      return routePath 
        ? '$routePath/${uri.lastSegdment}'
        : RoutePaths.home;
    }
  }
}