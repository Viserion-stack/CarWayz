import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_localizations.dart';
import 'package:car_wayz/presentation/common_ui/logo_widget.dart';
import 'package:car_wayz/presentation/screens/signup/widgets/sigup_form.dart';

class SignUpScreen extends ConsumerWidget {
  static const routeName = '/signup';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: const Column(
        children: [
          Gap.xxxLarge,
          LogoWidget(),
          Gap.xLarge,
          SignUpForm(),
        ],
      ),
      bottomNavigationBar: const _BottomSection(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () {
        context.go(LoginScreen.routeName);
      },
      child: Text(
        context.strings.loginButtonText,
        style: context.textTheme.bodyLarge!
            .copyWith(color: context.palette.textOnPrimaryColor),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Insets.large,
        left: Insets.xLarge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Have an Account?',
            style: context.textTheme.bodyMedium!
                .copyWith(color: context.palette.textOnPrimaryColor),
          ),
          _SignUpButton(),
        ],
      ),
    );
  }
}
