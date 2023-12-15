import 'package:car_wayz/export.dart';

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
          GoRoute(
            path: AddScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => addRoute(state),
          ),
          GoRoute(
            path: SignUpScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => siginUpRoute(state),
          ),
        ],
      );
}
