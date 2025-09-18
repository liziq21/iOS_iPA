import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/live/live_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/user/user_screen.dart';
import '../screens/video/video_screen.dart';
//import 'route_paths.dart';

part 'router.g.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
);


@TypedGoRoute<HomeRouteData>(path: '/')
class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen(
      onLive: (roomId) => LiveRouteData(roomId: roomId).go(context),
      onSearch: (query) => SearchRouteData(initialQuery: query).go(context),
      onUser: (mid) => SearchRouteData(mid: mid).go(context),
      onSearch: (id) => SearchRouteData(id: id).go(context),
    );
  }
}

@TypedGoRoute<LiveRouteData>(path: '/live/:roomId')
class LiveRouteData extends GoRouteData with $LiveRouteData {
  final String roomId;
  
  const LiveRouteData({ required this.roomId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LiveScreen(
      roomId: roomId,
      onBackClick: () => context.pop(),
    );
  }
}

@TypedGoRoute<SearchRouteData>(path: '/search')
class SearchRouteData extends GoRouteData with $SearchRouteData {
  final String query;
  
  const SearchRouteData({this.query = ''});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(
      query: query,
      onBackClick: () => context.pop(),
    );
  }
}

@TypedGoRoute<UserRouteData>(path: '/user/:mid')
class UserRouteData extends GoRouteData with $UserRouteData {
  final String mid;
  
  const UserRouteData({ required this.mid});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserScreen(
      mid: mid,
      onBackClick: () => context.pop(),
    );
  }
}

@TypedGoRoute<VideoRouteData>(path: '/video/:id')
class VideoRouteData extends GoRouteData with $VideoRouteData {
  final String id;
  /*final String? cid;
  final String? comment_root_id;
  final String? comment_secondary_id;
  final String? dm_progress;*/
  
  const VideoRouteData({
    this.id,
    /*this.cid,
    this.comment_root_id,
    this.comment_secondary_id,
    this.dm_progress,*/
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return VideoScreen(
      onBackClick: () => context.pop(),
      id: id,
      /*cid: cid,
      commentRootId: comment_root_id,
      commentSecondaryId: comment_secondary_id,
      dmProgress: dm_progress,*/
    );
  }
}
