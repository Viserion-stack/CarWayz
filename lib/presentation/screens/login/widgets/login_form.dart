import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_localizations.dart';
import 'package:car_wayz/presentation/common/validators.dart';
import 'package:car_wayz/presentation/common_ui/car_wayz_input_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final _form = GlobalKey<FormState>();
  late String email;
  late String password;

  Future<void> _submit() async {
    final bool isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      ref.read(authProvider.notifier).logIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.large),
      child: Column(
        children: [
          Form(
            key: _form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarWayzInputField(
                  label: context.strings.email,
                  validator: (value) => emailValidator(value),
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                ),
                Gap.large,
                CarWayzInputField(
                  label: context.strings.password,
                  isObscureText: true,
                  validator: (value) => passwordValidator(value),
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                ),
              ],
            ),
          ),
          Gap.medium,
          _LoginButton(onTap: _submit)
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const _LoginButton({
    required this.onTap,
  });

  static const _buttonRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Insets.large,
        left: Insets.large,
      ),
      child: ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
          backgroundColor: context.palette.accentColor,
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.xxxLarge),
          child: Text(context.strings.loginButtonText),
        ),
      ),
    );
  }
}
