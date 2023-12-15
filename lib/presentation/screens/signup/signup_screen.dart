import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/signup/widgets/sigup_form.dart';

class SignUpScreen extends ConsumerWidget {
  static const routeName = '/signup';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
      ),
      body: const Center(
        child: SignUpForm(),
      ),
    );
  }
}
