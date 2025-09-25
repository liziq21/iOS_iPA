import 'package:flutter/material.dart';
import '../navigation/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      routeInformationParser: _CustomRouteInformationParser(router.routeInformationParser),
    );
  }
}

class _CustomRouteInformationParser extends RouteInformationParser<RouteMatchList> {
  final RouteInformationParser<RouteMatchList> _originalParser;

  _CustomRouteInformationParser(this._originalParser);

  @override
  Future<RouteMatchList> parseRouteInformation(RouteInformation routeInformation) async {
    if (routeInformation.location?.startsWith('bilibili://') ?? false) {
      final modifiedLocation = routeInformation.location!.replaceFirst(
        'bilibili://', 
        'bilibili:///'
      );
      routeInformation = RouteInformation(location: modifiedLocation);
    }
    return _originalParser.parseRouteInformation(routeInformation);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteMatchList configuration) {
    return _originalParser.restoreRouteInformation(configuration);
    //return result ?? RouteInformation(location: '/');
  }
}