import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

Future<String> getFinalUrlWithDio(String url) async {
  final dio = Dio();
  try {
    final response = await dio.head(
      url,
      options: Options(validateStatus: (status) => true),
    );
    if (response.isRedirect) {
      return getFinalUrlWithDio(response.realUri.toString());
    }
    return url;
  } catch (e) {
    return url; // Bei Fehlern die ursprüngliche URL zurückgeben
  }
}

extension UriExtensions on Uri {
  Future<Uri> getFinalUrl() async {
    var finalUri = this;
    final dio = Dio();
    try {
    for (var i = 0; i < 5; i++) {
      final response = await dio.head(
        url,
        options: Options(validateStatus: (status) => true),
      );
      if (response.isRedirect) {
        return getFinalUrlWithDio(response.realUri.toString());
      }
      return url;
    } catch (e) {
      return url; // Bei Fehlern die ursprüngliche URL zurückgeben
    }
      if (response.statusCode case 301 || 302 || 303 || 307 || 308) {
        final location = response.headers['location'];
        if (location == null || location.isEmpty) {
          throw Exception('getFinalUrl ${finalUri.toString()}: Not Location-Header');
        }
        finalUri = Uri.parse(location);
      } else {
        return finalUri;
      }
    }
    throw Exception('getFinalUrl ${toString()}: 重定向过多');
  }
  
  String get lastSegdment => pathSegments.isNotEmpty ? pathSegments.last : "";
  
  List<String> get hostParts => host.split('.');
  
  String get secondLevelDomain => hostParts.length >= 2 ? hostParts[0] : "";
  
  bool get isHTTPScheme => scheme == 'http' || scheme == 'https';
  
}

