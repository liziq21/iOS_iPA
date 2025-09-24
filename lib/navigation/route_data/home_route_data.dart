part of '../router.dart';

extension BuildContextHome on BuildContext {
  void navToHome() => HomeRouteData().push(this);
}

@TypedGoRoute<HomeRouteData>(path: '/${RoutePath.home}')
@immutable
class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen(
      onLive: (roomId) => context.navToLive(roomId),
      onSearch: (query) => context.navToSearch(query),
      onSpace: (mid) => context.navToSpace(mid),
      onVideo: (id) => context.navToVideo(id),
    );
  }
}

