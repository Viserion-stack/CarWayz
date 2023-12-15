import 'package:car_wayz/export.dart';

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: const Text('Join to us'),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Email Adress'),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter valid email adress.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            email = newValue!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Password'),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Enter least 6 characters.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          onSaved: (newValue) {
                            password = newValue!;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Confirm Password'),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value != password) {
                              return 'Passowrd did not match.';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            //password = newValue!;
                          },
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Gap.medium,
          _LoginButton(onTap: _submit),
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
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('SignUpForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed: onTap,
      child: const Text('Sign Up'),
    );
  }
}
