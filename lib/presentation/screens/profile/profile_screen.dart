import 'package:car_wayz/export.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: ProfileScreen());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile screen',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.palette.textOnPrimaryColor),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout();
                ref
                    .read(dashboardProvider.notifier)
                    .update((state) => state = DashboardState.home);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: context.palette.accentColor),
              child: const Text('Wyloguj'),
            )
          ],
        ),
      ),
    );
  }
}
