part of '../router.dart';

extension on BuildContext {
  void navToHome() => HomeRouteData().go(this);
}

@TypedGoRoute<HomeRouteData>(path: RoutePaths.home.fullPath)
@immutable
class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen(
      onLive: (roomId) => context.navToLive(roomId: roomId),
      onSearch: (query) => context.navToSearch(query: query),
      onUser: (mid) => context.navToUser(mid: mid),
      onVideo: (id) => context.navToVideo(id: id),
    );
  }
}

