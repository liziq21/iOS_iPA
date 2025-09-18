part of '../router.dart';

@TypedGoRoute<HomeRouteData>(path: '/')
@immutable
class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen(
      onLive: (roomId) => LiveRouteData(roomId: roomId).go(context),
      onSearch: (query) => SearchRouteData(query: query).push(context),
      onUser: (mid) => UserRouteData(mid: mid).go(context),
      onVideo: (id) => VideoRouteData(id: id).go(context),
    );
  }
}

