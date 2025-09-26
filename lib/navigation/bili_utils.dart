import '../network/utils/uri_extensions.dart';
import 'route_path.dart';

class BiliUtils {
  static String? getRoutePath(Uri uri) {
    if (!uri.isHTTPScheme) {
      if (!uri.isScheme('bilibili') && uri.host.isEmpty && uri.toString().startsWith('bilibili:///')) {
        throw Exception('Scheme is ${uri.scheme}: getRoutePath error');
      }
      return Uri.decodeComponent(
        Uri(
          path: '/${uri.host}${uri.path}',
          queryParameters: uri.queryParametersAll.isEmpty ? null : uri.queryParametersAll,
          fragment: uri.fragment.isEmpty ? null : uri.fragment,
        ).toString(),
      );
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