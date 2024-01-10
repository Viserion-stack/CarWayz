import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common_ui/facebook_sign_in_button.dart';
import 'package:car_wayz/presentation/common_ui/google_sign_in_button.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FacebookSignInButton(),
        HorizontalGap.large,
        GoogleSignInButton(),
      ],
    );
  }
}
