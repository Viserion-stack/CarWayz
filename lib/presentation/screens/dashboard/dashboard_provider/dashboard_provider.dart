import 'package:car_wayz/export.dart';

enum DashboardState {
  home,
  splash,
  add,
  settings,
}

final dashboardProvider =
    StateProvider<DashboardState>((ref) => DashboardState.home);
