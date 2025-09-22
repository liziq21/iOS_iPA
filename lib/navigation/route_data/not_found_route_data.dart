part of '../router.dart';

@TypedGoRoute<NotFoundRouteData>(path: '/${RoutePath.NotFound}/')
@immutable
class NotFoundRouteData extends GoRouteData with $NotFoundRouteData {
  const NotFoundRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotFoundScreen(
      uri: start.extra as String? ?? '',
    );
  }
}