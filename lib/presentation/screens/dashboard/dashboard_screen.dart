import 'package:car_wayz/export.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({
    super.key,
  });

  get iconSize => null;

  static Page<void> page() =>
      const MaterialPage<void>(child: DashboardScreen());

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
          backgroundColor: context.palette.primaryColor,
          appBar: const DashboardAppBar(),
          body: FlowBuilder(
            state: ref.watch(dashboardProvider),
            onGeneratePages: onGenerateDashboardViewPages,
            observers: [
              HeroController(),
            ],
          ),
          bottomNavigationBar: const DashboardBottomBar(),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () => context.push(AddScreen.routeName),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.palette.accentColor,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: iconSize,
                  color: context.palette.primaryColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
