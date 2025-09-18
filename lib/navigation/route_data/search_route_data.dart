part '../router.dart';

@TypedGoRoute<SearchRouteData>(path: '/search')
class SearchRouteData extends GoRouteData with $SearchRouteData {
  final String? query;
  
  const SearchRouteData({this.query = ''});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(
      initialQuery: query ?? '',
      onBackClick: () => context.pop(),
    );
  }
}

