part of '../router.dart';

extension on BuildContext {
  void navToUser(String mid) => UserRouteData(mid).push(this);
}

@TypedGoRoute<UserRouteData>(path: '${RoutePath.user}/:mid')
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

