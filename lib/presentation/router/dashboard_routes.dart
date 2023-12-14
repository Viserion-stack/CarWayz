import 'package:car_wayz/export.dart';

List<Page<dynamic>> onGenerateDashboardViewPages(
  DashboardState state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case DashboardState.home:
      return [HomeScreen.page()];
    case DashboardState.splash:
      return [SplashScreen.page()];
    case DashboardState.settings:
      return [AddScreen.page()];
    case DashboardState.add:
      return [AddScreen.page()];
  }
}
