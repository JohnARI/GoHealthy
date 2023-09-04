import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';


extension BuildContextExtension on BuildContext {
  AppLocalizations? get translate => AppLocalizations.of(this);
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  void navigateNamedRoute(String routeName) => GoRouter.of(this).goNamed(routeName);
  void navigateNamedRouteWithParameter(String routeName, Map<String, String> pathParameters) => GoRouter.of(this).goNamed(routeName, pathParameters: pathParameters);
  void pushNamedRoute(String routeName) => GoRouter.of(this).goNamed(routeName);
  void pushNamedRouteWithParameter(String routeName, Map<String, String> pathParameters) => GoRouter.of(this).goNamed(routeName, pathParameters: pathParameters);
}