import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  static const _logoHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.large),
      child: SizedBox(
        height: _logoHeight,
        width: double.infinity,
        child: Center(child: context.svgImage(AppAssets.logoText)),
      ),
    );
  }
}
