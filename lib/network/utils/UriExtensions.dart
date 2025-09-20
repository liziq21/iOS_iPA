import 'package:http/http.dart' as http;

extension on Uri {
  Future<Uri> getFinalUrl() async {
    for (var i = 0; i < 5; i++) {
      final response = await http.get(this);
      if (response.statusCode case 301 || 302 || 303 || 307 || 308) {
        final location = response.headers['location'];
        if (location == null || location.isEmpty) {
          throw Exception('getFinalUrl ' + Uri.toString + ': Not Location-Header');
        }
        this = Uri.parse(location);
      } else {
        return this;
      }
    }
    throw Exception('getFinalUrl ' + Uri.toString + ': 重定向过多');
  }
  
  String get lastSegdment => pathSegments.isNotEmpty ? pathSegments.last : "";
  
  List<String> get hostParts => host.split('.');
  
  String get secondLevelDomain => hostParts.length >= 2 ? hostParts[0] : "";
  
  bool get isHTTPScheme => scheme == 'http' || scheme == 'https';
  
}

