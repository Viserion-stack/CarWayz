import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_provider/app_provider.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_provider.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_state.dart';
import 'package:car_wayz/presentation/components/navigation_hub.dart';

class AppContainer extends ConsumerStatefulWidget {
  const AppContainer({
    super.key,
  });

  @override
  AppContainerState createState() => AppContainerState();
}

class AppContainerState extends ConsumerState<AppContainer> {
  @override
  Widget build(BuildContext context) {
    final deepLink = ref.watch(authProvider).authStateType;

    if (deepLink != AuthStateType.initial) {
      ref
          .read(appProvider.notifier)
          .update((state) => state = AppState.dashboard);
    } else {
      ref.read(appProvider.notifier).update((state) => state = AppState.login);
    }

    return const NavigationHub();
  }
}
