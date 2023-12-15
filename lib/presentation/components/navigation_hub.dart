import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_state.dart';
class NavigationHub extends StatelessWidget {
  const NavigationHub({
    required this.rootNavigationKey,
    required this.childWidget,
    super.key,
  });

  final GlobalKey<NavigatorState> rootNavigationKey;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final nav = ref.watch(authProvider);

        debugPrint(nav.authStateType.toString());
        switch (nav.authStateType) {
          case AuthStateType.unauthenticated:
            debugPrint("checked initial");
            rootNavigationKey.currentContext?.go(LoginScreen.routeName);
          case AuthStateType.authenticated:
            debugPrint("checked logged");
            rootNavigationKey.currentContext?.go(DashboardScreen.routeName);
        }

        return childWidget;
      },
    );
  }
}
