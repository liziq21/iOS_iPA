part of '../router.dart';

@TypedGoRoute<UserRouteData>(path: '/user/:mid')
@immutable
class UserRouteData extends GoRouteData with $UserRouteData {
  final String mid;
  
  const UserRouteData({ required this.mid });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserScreen(
      mid: mid,
      onBackClick: () => context.pop(),
    );
  }
}

