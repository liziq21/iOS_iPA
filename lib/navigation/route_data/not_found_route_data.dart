part of '../router.dart';

@TypedGoRoute<NotFoundRouteData>(path: '/${RoutePath.notFound}/')
@immutable
class NotFoundRouteData extends GoRouteData with $NotFoundRouteData {
  const NotFoundRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotFoundScreen(
      uri: state.extra as String? ?? '',
    );
  }
}