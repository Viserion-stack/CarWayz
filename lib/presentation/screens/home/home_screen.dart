import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_provider/app_provider.dart';
import 'package:car_wayz/presentation/screens/home/provider/home_provider.dart';

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
            child: Text(name),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(homeProvider.notifier).changeName();
              ref.read(appProvider.notifier).update((state) => state = AppState.login);
            },
            child: Text('Zmien text'),
          ),
        ],
      ),
    );
  }
}
