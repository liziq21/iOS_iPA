import '../network/utils/uri_extensions.dart';
import 'route_path.dart';

class BiliUtils {
  static String? getRoutePath(Uri uri) {
    if (uri.host.isEmpty) return null;
    
    final String path;
    if (uri.isHTTPScheme) {
      var secondLevelDomain = uri.secondLevelDomain;
      switch (secondLevelDomain) {
        RoutePath.live || RoutePath.search ||
        RoutePath.space => path = '/$secondLevelDomain$path',
        _ => return null,
      }
      
    } else {
      if (!uri.isScheme('bilibili') && uri.toString().startsWith('bilibili:///')) {
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