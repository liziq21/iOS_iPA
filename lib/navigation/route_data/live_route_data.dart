part of '../router.dart';

@TypedGoRoute<LiveRouteData>(path: '/live/:roomId')
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

