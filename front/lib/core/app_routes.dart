import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/pages/home_page.dart';
import '/shared/routes.dart';

/// The router instance for handling application navigation.
///
/// The [router] instance is responsible for managing the application's navigation.
/// It uses the [GoRouter] package and is initialized with an initial location and a list of routes.
/// The routes are defined using [GoRoute], which specifies the route name, path, and builder function.
final GoRouter router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
    name: AppRoute.HOME_ROUTE_NAME,
    path: '/',
    builder: (BuildContext context, GoRouterState state) => const HomePage(),
  ),
]);
