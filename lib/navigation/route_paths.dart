

enum RoutePath {
  home(''),
  live('live'),
  search('search'),
  space('space'),
  video('video');

  final String path;

  const RoutePath(this.path);
  
  @override
  String toString() => '/$path';
  
  String get fullPath => '/$path';

  String withQueryParameters(Map<String, String> params) =>
    params.isEmpty
      : toString()
      ? params.entries
        .map((entry) => '{Uri.encodeComponent(entry.key)}={Uri.encodeComponent(entry.value)}')
        .join('&');
        
  static bool isValidPath(String path) {
    return values.any((route) => route.path == path);
  }

  static RoutePath? fromPath(String path) {
    return values.firstWhere((route) => route.path == path, orElse: () => null);
  }
}

