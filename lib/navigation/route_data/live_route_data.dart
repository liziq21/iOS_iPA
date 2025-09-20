part of '../router.dart';

extension on BuildContext {
  void navToLive(String roomId) => LiveRouteData(roomId).push(this);
}

enum RoutePathh {
  live('live');

  final String path;
  const RoutePath(this.path);

  @override
  String toString() => '/$path';  // Nutzerdefinierte Darstellung
}

@TypedGoRoute<LiveRouteData>(path: '${RoutePathh.live.toString()}/:roomId')
@immutable
class LiveRouteData extends GoRouteData with $LiveRouteData {
  final String roomId;
  
  const LiveRouteData({ required this.roomId });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LiveScreen(
      roomId: roomId,
      onBackClick: () => context.pop(),
    );
  }
}

