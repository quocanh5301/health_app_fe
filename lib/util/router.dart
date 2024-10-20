// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/feature/first_intro/first_intro.dart';
import 'package:health_app_flutter/feature/base/base_screen.dart';
import 'package:health_app_flutter/feature/login/log_in_screen.dart';
import 'package:health_app_flutter/feature/run_tracking/run_tracking_screen.dart';
part 'router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: SharedPref.getIsFirstTime()
      // ? const FirstTimeIntroRoute().location
      ?const BaseRoute().location
      : SharedPref.getApiToken().isEmpty
          ? const LoginRoute().location
          : const BaseRoute().location,
  routes: $appRoutes,
);

@TypedGoRoute<LoginRoute>(path: Routes.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

@TypedGoRoute<FirstTimeIntroRoute>(path: Routes.firstTimeIntro)
class FirstTimeIntroRoute extends GoRouteData {
  const FirstTimeIntroRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FirstTimeIntro();
}

@TypedGoRoute<BaseRoute>(path: Routes.base)
class BaseRoute extends GoRouteData {
  const BaseRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BaseScreen();
}

@TypedGoRoute<RunTrackingRoute>(path: Routes.runTracking)
class RunTrackingRoute extends GoRouteData {
  const RunTrackingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RunTrackingScreen();
}

class Routes {
  static const String firstTimeIntro = '/first_time_intro';
  static const String login = '/login';
  static const String base = '/base';
  static const String runTracking = '/run_tracking';
}
