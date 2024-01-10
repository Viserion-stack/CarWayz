import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_localizations.dart';
import 'package:car_wayz/presentation/common_ui/logo_widget.dart';
import 'package:car_wayz/presentation/screens/login/widgets/login_form.dart';
import 'package:car_wayz/presentation/screens/login/widgets/sign_in_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap.xxxLarge,
            const LogoWidget(),
            const LoginForm(),
            Gap.large,
            Text(
              context.strings.loginOr,
              style: context.textTheme.bodyLarge!
                  .copyWith(color: context.palette.textOnPrimaryColor),
            ),
            Gap.medium,
            Text(
              context.strings.loginSignWith,
              style: context.textTheme.bodyLarge!
                  .copyWith(color: context.palette.textOnPrimaryColor),
            ),
            Gap.xLarge,
            const SignInButtons(),
          ],
        ),
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
        context.push(SignUpScreen.routeName);
      },
      child: Text(
        context.strings.singUpButtonText,
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
            'Don\'t have an Account?',
            style: context.textTheme.bodyMedium!
                .copyWith(color: context.palette.textOnPrimaryColor),
          ),
          _SignUpButton(),
        ],
      ),
    );
  }
}
