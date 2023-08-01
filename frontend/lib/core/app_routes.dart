import 'package:flutter/material.dart';
import 'package:go_healthy/features/profile/pages/profile_page.dart';
import 'package:go_healthy/features/statistics/pages/statistics_page.dart';
import 'package:go_healthy/shared/colors.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/login/pages/login_page.dart';
import '../features/authentication/register/pages/register_page.dart';
import '../features/followup/followup_add_meals/pages/followup_add_meal_page.dart';
import '../features/home/pages/home_page.dart';
import '../utils/shared_preference.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_navbar.dart';
import '/shared/routes.dart';

class RouteInitializer {
  static String determineInitialRoute() {
    if (SharedPreference.getAccessToken() != null) {
      return AppRoute.HOME.path;
    } else {
      return AppRoute.LOGIN.path;
    }
  }
}

/// The router instance for handling application navigation.
///
/// The [router] instance is responsible for managing the application's navigation.
/// It uses the [GoRouter] package and is initialized with an initial location and a list of routes.
/// The routes are defined using [GoRoute], which specifies the route name, path, and builder function.
final GoRouter router = GoRouter(
  initialLocation: RouteInitializer.determineInitialRoute(),
  routes: <RouteBase>[
    GoRoute(
      name: AppRoute.LOGIN.name,
      path: AppRoute.LOGIN.path,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      name: AppRoute.REGISTER.name,
      path: AppRoute.REGISTER.path,
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterPage(),
    ),
    GoRoute(
      name: AppRoute.ADD_MEAL.name,
      path: AppRoute.ADD_MEAL.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          child: FollowupAddMealPage(
            mealType: state.pathParameters['mealType']!,
          ),
        );
      },
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBarGeneral(name: "Follow-up"),
          ),
          body: Container(
              decoration: const BoxDecoration(color: AppColor.WHITE),
              child: child),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRoute.HOME.name,
          path: AppRoute.HOME.path,
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ),
        GoRoute(
          name: AppRoute.STATS.name,
          path: AppRoute.STATS.path,
          builder: (BuildContext context, GoRouterState state) =>
              const StatisticsPage(),
        ),
        GoRoute(
          name: AppRoute.PROFILE.name,
          path: AppRoute.PROFILE.path,
          builder: (BuildContext context, GoRouterState state) =>
              const ProfilePage(),
        ),
      ],
    ),
  ],
);
