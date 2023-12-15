import 'package:car_wayz/export.dart';



class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final name = ref.watch(homeProvider).name;

    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Center(
        child: Text(
          'Home screen',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: context.palette.textOnPrimaryColor),
        ),
      ),
    );
  }
}
