import 'package:car_wayz/data/auth_controller.dart';
import 'package:car_wayz/export.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});
  void signInWithGoogle(BuildContext ctx, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).signInWithGoogle(ctx);
  }

  static const _iconSize = 30.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return GestureDetector(
      onTap: () => signInWithGoogle(context, ref),
      child: Container(
        padding: const EdgeInsets.all(Insets.small),
        decoration: BoxDecoration(
          color: context.palette.inactiveColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: isLoading
            ? CircularProgressIndicator.adaptive(
                backgroundColor: context.palette.textOnPrimaryColor,
              )
            : const Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
                size: _iconSize,
              ),
      ),
    );
  }
}
