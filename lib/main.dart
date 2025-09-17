import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes/routes.dart';

void main () {
    runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
);

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    )
  }
}
