import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      routeInformationParser: _GoRouteInformationParser(
        configuration: router.configuration,
        onParserException: null
      ),
    );
  }
}

class _GoRouteInformationParser extends GoRouteInformationParser {
  _GoRouteInformationParser({required super.configuration, required super.onParserException});

  @override
  Future<RouteMatchList> parseRouteInformationWithDependencies(
    RouteInformation routeInformation,BuildContext context
  ) {
    
    var uri = routeInformation.uri;
    if (uri.isScheme('bilibili') && uri.host != null) {
      uri = uri.replace(
        host: null,
        path: '/${uri.host}/${uri.path}'
      );
    }
    
    return super.parseRouteInformationWithDependencies(
      RouteInformation(
        uri: uri,
        state: routeInformation.state,
      ),
      context
    );
  }
}
