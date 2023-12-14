import 'package:car_wayz/presentation/screens/dashboard/dashboard_route.dart';
import 'package:car_wayz/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:car_wayz/presentation/screens/login/login_route.dart';
import 'package:car_wayz/presentation/screens/login/login_screen.dart';
import 'package:car_wayz/presentation/screens/splash/splash_route.dart';
import 'package:car_wayz/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouteFactory {
  GoRouter router({
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> shellNavigatorKey,
  }) =>
      GoRouter(
        initialLocation: SplashScreen.routeName,
        navigatorKey: rootNavigatorKey,
        errorBuilder: (context, state) => splashRoute(state),
        routes: [
          GoRoute(
            path: SplashScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => splashRoute(state),
          ),
          GoRoute(
            path: LoginScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => loginRoute(state),
          ),
          GoRoute(
            path: DashboardScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => dashboardRoute(state),
          ),
        ],
      );
}
