import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/live/live_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/user/user_screen.dart';
import '../screens/video/video_screen.dart';
//import 'route_paths.dart';

part 'route_data/home_route_data.dart';
part 'route_data/live_route_data.dart';
part 'route_data/search_route_data.dart';
part 'route_data/user_route_data.dart';
part 'route_data/video_route_data.dart';

part 'router.g.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
);


