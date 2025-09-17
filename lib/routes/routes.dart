//import 'package:go_router/go_router.dart';
import '../pages/live_page.dart';
import '../pages/search_page.dart';
import '../pages/user_page.dart';
import '../pages/video_page.dart';
//import 'route_paths.dart';

part 'routes.g.dart'

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
class LiveRouteData extends GoRouteData with LiveRouteData {
  const LiveRouteData({ required this.roomId});
  final String roomId;

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
  const SearchRouteData({this.query = ''});
  final String query;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(
      query: query,
      onBackClick: () => context.pop(),
    );
  }
}

@TypedGoRoute<UesrRouteData>(path: '/user/:mid')
class UserRouteData extends GoRouteData with $UserRouteData {
  const UserRouteData({ required this.mid});
  final String mid;

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
  const VideoRouteData({
    required this.id,
    /*this.cid,
    this.comment_root_id,
    this.comment_secondary_id,
    this.dm_progress,*/
  });
  
  final String id;
  /*final String? cid;
  final String? comment_root_id;
  final String? comment_secondary_id;
  final String? dm_progress;*/

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return VideoScreen(
      onBackClick: () => { context.pop(); },
      id: id,
      /*cid: cid,
      commentRootId: comment_root_id,
      commentSecondaryId: comment_secondary_id,
      dmProgress: dm_progress,*/
    );
  }
}
