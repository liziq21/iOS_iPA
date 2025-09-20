import '../network/utils/UriExtensions.dart';

class BiliUtils {
  static Future<String?> httpToRoutePath(Uri uri) async {
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