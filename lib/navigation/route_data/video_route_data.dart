part of '../router.dart';

extension on BuildContext {
  void navToVideo(String id) => VideoRouteData(id).push(this);
}

@TypedGoRoute<VideoRouteData>(path: '${RoutePath.live}/:id')
@immutable
class VideoRouteData extends GoRouteData with $VideoRouteData {
  final String id;
  /*final String? cid;
  final String? comment_root_id;
  final String? comment_secondary_id;
  final String? dm_progress;*/
  
  const VideoRouteData({
    required this.id,
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
