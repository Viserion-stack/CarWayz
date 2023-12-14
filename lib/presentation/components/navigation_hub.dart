import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_provider.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_state.dart';
import 'package:car_wayz/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:car_wayz/presentation/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

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

        print(nav.authStateType);
        switch (nav.authStateType) {
          case AuthStateType.initial:
            print("checked initial");
            rootNavigationKey.currentContext?.go(LoginScreen.routeName);
          case AuthStateType.logged:
            print("checked logged");
            rootNavigationKey.currentContext?.go(DashboardScreen.routeName);
        }

        return childWidget;
      },
    );
  }
}
