part of '../router.dart';

extension on BuildContext {
  void navToSearch(String? query) => SearchRouteData(query).push(this);
}

@TypedGoRoute<SearchRouteData>(path: RoutePaths.search.fullPath)
@immutable
class SearchRouteData extends GoRouteData with $SearchRouteData {
  final String? query;
  
  const SearchRouteData({this.query});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(
      initialQuery: query,
      onBackClick: () => context.pop(),
    );
  }
}

