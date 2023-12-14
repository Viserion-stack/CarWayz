import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_provider/app_provider.dart';
import 'package:car_wayz/presentation/router/app_route_factory.dart';

class NavigationHub extends StatelessWidget {
  const NavigationHub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return FlowBuilder(
          state: ref.watch(appProvider),
          onGeneratePages: onGenerateAppViewPages,
        );
      },
    );
  }
}
