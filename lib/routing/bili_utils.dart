import '../network/utils/uri_extensions.dart';
import 'routes.dart';

class BiliUtils {
  static String? getRoutes(Uri uri) {
    if (uri.host.isEmpty) return null;
    
    late final String path;
    if (uri.isHTTPScheme) {
      var secondLevelDomain = uri.secondLevelDomain;
      switch (secondLevelDomain) {
        Routes.liveRelative || Routes.searchRelative ||
        Routes.spaceRelative => path = '/$secondLevelDomain$path',
        _ => return null,
      }
      
    } else {
      if (!uri.isScheme('bilibili') && uri.toString().startsWith('bilibili:///')) {
        throw Exception('Scheme is ${uri.scheme}: getRoutes error');
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