import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_localizations.dart';
import 'package:car_wayz/presentation/common/validators.dart';
import 'package:car_wayz/presentation/common_ui/car_wayz_input_field.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends ConsumerState<SignUpForm> {
  final _form = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Future<void> _submit() async {
    final bool isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      ref.read(authProvider.notifier).signUp(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Insets.large),
          child: Form(
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
                    // onChanged: (value) {
                    //   password = value;
                    // },
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                  ),
                  Gap.large,
                  CarWayzInputField(
                    label: context.strings.confirmPassword,
                    isObscureText: true,
                    validator: (value) =>
                        confirmPasswordValidator(value, password),
                    onSaved: (newValue) {
                      //password = newValue!;
                    },
                  ),
                ],
              )),
        ),
        Gap.medium,
        _SignUpButton(onTap: _submit),
      ],
    );
  }
}

class _SignUpButton extends StatelessWidget {
  final VoidCallback onTap;
  const _SignUpButton({
    required this.onTap,
  });

  static const _buttonRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('SignUpForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonRadius),
        ),
        backgroundColor: context.palette.accentColor,
      ),
      onPressed: onTap,
      child: const Text('Sign Up'),
    );
  }
}
