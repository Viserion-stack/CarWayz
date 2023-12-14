import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/login/widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: const Center(
        child: LoginForm(),
      ),
    );
  }
}
