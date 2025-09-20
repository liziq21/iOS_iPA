part of '../router.dart';

extension on BuildContext {
  void navToLive(String roomId) => LiveRouteData(roomId).push(this);
}

@TypedGoRoute<LiveRouteData>(path: RoutePaths.live.fullPath+'/:roomId')
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

