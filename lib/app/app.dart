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
        onParserException: router.onParserException
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
    
    final uri = routeInformation.uri;
    if (uri.isScheme('bilibili') && uri.host != null) {
      uri = uri.replace(
        host: null,
        path: '/${newUri.host}/${newUri.path}'
      )
    }
    
    return super.parseRouteInformationWithDependencies(
      routeInformation: RouteInformation(
        uri: uri,
        state: routeInformation.state,
      ),
      context: context
    );
  }
}
