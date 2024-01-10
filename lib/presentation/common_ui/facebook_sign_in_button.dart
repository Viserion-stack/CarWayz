import 'package:car_wayz/export.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({super.key});

  static const _iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(Insets.small),
        decoration: BoxDecoration(
          color: context.palette.inactiveColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          FontAwesomeIcons.facebook,
          color: Colors.white,
          size: _iconSize,
        ),
      ),
    );
  }
}
