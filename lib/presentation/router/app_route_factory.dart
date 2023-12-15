import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/add_post/add_post_route.dart';
import 'package:car_wayz/presentation/screens/add_post/add_post_screen.dart';

class AppRouteFactory {
  GoRouter router({
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> shellNavigatorKey,
  }) =>
      GoRouter(
        initialLocation: LoginScreen.routeName,
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
          GoRoute(
            path: AddPostScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => addPostRoute(state),
          ),
        ],
      );
}
