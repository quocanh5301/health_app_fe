// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $firstTimeIntroRoute,
      $baseRoute,
      $runTrackingRoute,
      $alarmListgRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $firstTimeIntroRoute => GoRouteData.$route(
      path: '/first_time_intro',
      factory: $FirstTimeIntroRouteExtension._fromState,
    );

extension $FirstTimeIntroRouteExtension on FirstTimeIntroRoute {
  static FirstTimeIntroRoute _fromState(GoRouterState state) =>
      const FirstTimeIntroRoute();

  String get location => GoRouteData.$location(
        '/first_time_intro',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $baseRoute => GoRouteData.$route(
      path: '/base',
      factory: $BaseRouteExtension._fromState,
    );

extension $BaseRouteExtension on BaseRoute {
  static BaseRoute _fromState(GoRouterState state) => const BaseRoute();

  String get location => GoRouteData.$location(
        '/base',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $runTrackingRoute => GoRouteData.$route(
      path: '/run_tracking',
      factory: $RunTrackingRouteExtension._fromState,
    );

extension $RunTrackingRouteExtension on RunTrackingRoute {
  static RunTrackingRoute _fromState(GoRouterState state) =>
      const RunTrackingRoute();

  String get location => GoRouteData.$location(
        '/run_tracking',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $alarmListgRoute => GoRouteData.$route(
      path: '/alarm_list',
      factory: $AlarmListgRouteExtension._fromState,
    );

extension $AlarmListgRouteExtension on AlarmListgRoute {
  static AlarmListgRoute _fromState(GoRouterState state) =>
      const AlarmListgRoute();

  String get location => GoRouteData.$location(
        '/alarm_list',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
