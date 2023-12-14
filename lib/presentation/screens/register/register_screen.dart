import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_provider/app_provider.dart';
import 'package:car_wayz/presentation/common/dimen.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login'),
            Gap.medium,
            TextButton(
              onPressed: () => ref
                  .read(appProvider.notifier)
                  .update((state) => state = AppState.login),
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
