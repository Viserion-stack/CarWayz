import 'package:car_wayz/data/auth_controller.dart';
import 'package:car_wayz/data/model/user_model.dart';
import 'package:car_wayz/export.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationHub extends ConsumerWidget {
  const NavigationHub({
    required this.rootNavigationKey,
    required this.childWidget,
    super.key,
  });

  final GlobalKey<NavigatorState> rootNavigationKey;
  final Widget childWidget;

  void getData(WidgetRef ref, User data) async {
    UserModel userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        ref.watch(authStateChangeProvider).when(
              data: (data) {
                if (data != null) {
                  debugPrint('Authenticated');
                  rootNavigationKey.currentContext
                      ?.go(DashboardScreen.routeName);
                  getData(ref, data);
                } else {
                  debugPrint('UnAuthenticated');

                  rootNavigationKey.currentContext?.go(LoginScreen.routeName);
                }

                return childWidget;
              },
              loading: CircularProgressIndicator.adaptive,
              error: (error, stackTrace) => Text(error.toString()),
            );

        return childWidget;
      },
    );
  }
}
