import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/live/live_screen.dart';
import '../screens/not_found/not_found_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/space/space_screen.dart';
import '../screens/video/video_screen.dart';
import 'bili_utils.dart';
import 'route_path.dart';

part 'route_data/home_route_data.dart';
part 'route_data/live_route_data.dart';
part 'route_data/not_found_route_data.dart';
part 'route_data/search_route_data.dart';
part 'route_data/space_route_data.dart';
part 'route_data/video_route_data.dart';
part 'router.g.dart';

final GoRouter router = GoRouter(
  onException: (_, GoRouterState state, GoRouter router) {
    final path = BiliUtils.httpToRoutePath(state.uri);
    if (path == null)  {
      router.go('/${RoutePath.notFound}/', extra: state.uri.toString());
    } else {
      router.go(path);
    }
  },
  routes: $appRoutes,
  initialLocation: '/${RoutePath.home}',
  //redirect: (context, state) => BiliUtils.httpToRoutePath(state.uri),
);
