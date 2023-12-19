import 'package:car_wayz/export.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: SplashScreen());

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    //ref.read(authProvider.notifier).onInitiated();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Splash screen'),
          ),
        ],
      ),
    );
  }
}
