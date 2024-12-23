// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/feature/base/base_screen.dart';
import 'package:health_app_flutter/feature/exercise_detail.dart/exercise_detail_screen.dart';
import 'package:health_app_flutter/feature/first_intro/first_intro.dart';
import 'package:health_app_flutter/feature/heart_bpm/heart_bpm_screen.dart';
import 'package:health_app_flutter/feature/login/ui/login_screen.dart';
import 'package:health_app_flutter/feature/register/ui/register_screen.dart';
import 'package:health_app_flutter/feature/run_tracking/run_tracking_screen.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: SharedPref.getIsFirstTime()
      ? const FirstTimeIntroRoute().location
      // ? const BaseRoute().location
      // ? const AlarmListRoute().location
      : SharedPref.getApiToken().isEmpty
          ? const LoginRoute().location
          : const BaseRoute().location,
  routes: $appRoutes,
);

@TypedGoRoute<LoginRoute>(path: Routes.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen();
}

@TypedGoRoute<RegisterRoute>(path: Routes.register)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterScreen();
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
  Widget build(BuildContext context, GoRouterState state) => const BaseScreen();
}

@TypedGoRoute<RunTrackingRoute>(path: Routes.runTracking)
class RunTrackingRoute extends GoRouteData {
  const RunTrackingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RunTrackingScreen();
}

@TypedGoRoute<HeartBPMTrackingRoute>(path: Routes.heartBPMTracking)
class HeartBPMTrackingRoute extends GoRouteData {
  const HeartBPMTrackingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const HeartBPMScreen();
}

@TypedGoRoute<ExerciseDetailRoute>(path: Routes.exerciseDetail)
class ExerciseDetailRoute extends GoRouteData {
  const ExerciseDetailRoute({required this.exerciseId});
  final int exerciseId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ExerciseDetailScreen(
        exerciseId: exerciseId,
      );
}

class Routes {
  static const String firstTimeIntro = '/first_time_intro';
  static const String login = '/login';
  static const String register = '/register';
  static const String base = '/base';
  static const String runTracking = '/run_tracking';
  static const String heartBPMTracking = '/heart_bpm_tracking';
  static const String alarmList = '/alarm_list';
  static const String exerciseDetail = '/exercise_detail';
}
