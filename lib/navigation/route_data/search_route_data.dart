part of '../router.dart';

extension BuildContextSearch on BuildContext {
  void navToSearch(String? query) => SearchRouteData(query).push(this);
}

@TypedGoRoute<SearchRouteData>(path: '/${RoutePath.search}')
@immutable
class SearchRouteData extends GoRouteData with $SearchRouteData {
  final String? keyword;
  
  const SearchRouteData({this.keyword});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(
      initialQuery: keyword,
      onBackClick: () => context.pop(),
    );
  }
}

