import 'uri_extensions.dart';
import 'routes.dart';

class BiliUtils {
  static String? getRoutePath(Uri uri) {
    if (uri.host.isEmpty) return null;
    
    String path;
    if (uri.isHTTPScheme) {
      var secondLevelDomain = uri.secondLevelDomain;
      switch (secondLevelDomain) {
        case Routes.liveRelative || Routes.searchRelative || Routes.spaceRelative:
          path = '/$secondLevelDomain$path',
        default:
          return null,
      }
      
    } else {
      if (!uri.isBilibiiScheme && uri.toString().startsWith('bilibili:///')) {
        throw Exception('Scheme is ${uri.scheme}: getRoutePath error');
      }
      path = '/${uri.host}${uri.path}';
    }
    
    return Uri.decodeComponent(
      Uri(
        path: path,
        queryParameters: uri.queryParametersAll.isEmpty ? null : uri.queryParametersAll,
        fragment: uri.fragment.isEmpty ? null : uri.fragment,
      ).toString(),
    );
  }
}