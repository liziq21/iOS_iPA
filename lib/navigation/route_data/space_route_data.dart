part of '../router.dart';

extension on BuildContext {
  void navToSpace(String mid) => SpaceRouteData(mid).push(this);
}

@TypedGoRoute<SpaceRouteData>(path: '/${RoutePath.space}/:mid')
@immutable
class SpaceRouteData extends GoRouteData with $SpaceRouteData {
  final String mid;
  
  const SpaceRouteData({ required this.mid });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SpaceScreen(
      mid: mid,
      onBackClick: () => context.pop(),
    );
  }
}

