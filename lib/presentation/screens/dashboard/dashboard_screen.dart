import 'package:car_wayz/export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  static Page<void> page() =>
      const MaterialPage<void>(child: DashboardScreen());

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          body: FlowBuilder(
              state: ref.watch(dashboardProvider),
              onGeneratePages: onGenerateDashboardViewPages),
          bottomNavigationBar: const CustomBottomBar(),
        );
      },
    );
  }
}
