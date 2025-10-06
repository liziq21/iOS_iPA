// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRouteData,
      $liveRouteData,
      $searchRouteData,
      $spaceRouteData,
      $videoRouteData,
      $notFoundRouteData,
    ];

RouteBase get $homeRouteData => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteDataExtension._fromState,
    );

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $liveRouteData => GoRouteData.$route(
      path: '/live/:roomId',
      factory: $LiveRouteDataExtension._fromState,
    );

extension $LiveRouteDataExtension on LiveRouteData {
  static LiveRouteData _fromState(GoRouterState state) => LiveRouteData(
        roomId: state.pathParameters['roomId']!,
      );

  String get location => GoRouteData.$location(
        '/live/${Uri.encodeComponent(roomId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $searchRouteData => GoRouteData.$route(
      path: '/search',
      factory: $SearchRouteDataExtension._fromState,
    );

extension $SearchRouteDataExtension on SearchRouteData {
  static SearchRouteData _fromState(GoRouterState state) => SearchRouteData(
        keyword: state.uri.queryParameters['keyword'],
      );

  String get location => GoRouteData.$location(
        '/search',
        queryParams: {
          if (keyword != null) 'keyword': keyword!,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $spaceRouteData => GoRouteData.$route(
      path: '/space/:mid',
      factory: $SpaceRouteDataExtension._fromState,
    );

extension $SpaceRouteDataExtension on SpaceRouteData {
  static SpaceRouteData _fromState(GoRouterState state) => SpaceRouteData(
        mid: state.pathParameters['mid']!,
      );

  String get location => GoRouteData.$location(
        '/space/${Uri.encodeComponent(mid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $videoRouteData => GoRouteData.$route(
      path: '/video/:id',
      factory: $VideoRouteDataExtension._fromState,
    );

extension $VideoRouteDataExtension on VideoRouteData {
  static VideoRouteData _fromState(GoRouterState state) => VideoRouteData(
        id: state.pathParameters['id']!,
        cid: state.uri.queryParameters['cid'],
        comment_root_id: state.uri.queryParameters['comment_root_id'],
        comment_secondary_id: state.uri.queryParameters['comment_secondary_id'],
        dm_progress: state.uri.queryParameters['dm_progress'],
      );

  String get location => GoRouteData.$location(
        '/video/${Uri.encodeComponent(id)}',
        queryParams: {
          if (cid != null) 'cid': cid!,
          if (comment_root_id != null) 'comment_root_id': comment_root_id!,
          if (comment_secondary_id != null) 'comment_secondary_id': comment_secondary_id!,
          if (dm_progress != null) 'dm_progress': dm_progress!,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $notFoundRouteData => GoRouteData.$route(
      path: '/404',
      factory: $NotFoundRouteDataExtension._fromState,
    );

extension $NotFoundRouteDataExtension on NotFoundRouteData {
  static NotFoundRouteData _fromState(GoRouterState state) =>
      NotFoundRouteData(
        uri: state.extra as Uri?,
      );

  String get location => GoRouteData.$location(
        '/404',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}