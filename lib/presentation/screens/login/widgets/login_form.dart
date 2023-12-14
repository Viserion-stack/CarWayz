import 'package:car_wayz/export.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final _form = GlobalKey<FormState>();
  late String email;
  late String password;

  Future<void> _submit() async {
    final bool isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      ref.read(authProvider.notifier).loginIn(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              20,
            ),
            child: Image.asset('assets/images/login.png'),
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
                          onSaved: (newValue) {
                            password = newValue!;
                          },
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Gap.medium,
          _LoginButton(onTap: _submit),
          _GoogleLoginButton(),
          _SignUpButton(),
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
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed: onTap,
      child: const Text('Login'),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () {},
      label: const Text(
        'SIGN IN WITH GOOGLE',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () {},
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
