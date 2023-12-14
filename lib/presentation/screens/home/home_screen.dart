import 'package:car_wayz/export.dart';



class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(homeProvider).name;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(name.toString()),
          ),
          FloatingActionButton(
            onPressed: () {

              ref.read(homeProvider.notifier).changeName();
              ref.read(appProvider.notifier).update((state) => state = AppState.login);
            },
            child: const Text('Zmien text'),
          ),
          Gap.medium,
          SizedBox(
            width: 100,
            child: FloatingActionButton(
              heroTag: 'default',
              onPressed: () {
                ref.read(authProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
