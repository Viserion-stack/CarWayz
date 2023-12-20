import 'package:car_wayz/data/auth_controller.dart';
import 'package:car_wayz/export.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});
  void signInWithGoogle(BuildContext ctx, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(ctx);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      icon: isLoading
          ? const CircularProgressIndicator.adaptive()
          : const Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () => signInWithGoogle(context, ref),
      label: isLoading
          ? const Text('Loading')
          : const Text(
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
