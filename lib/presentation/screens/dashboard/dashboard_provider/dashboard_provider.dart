import 'package:car_wayz/export.dart';

enum DashboardState {
  home,
  friends,
  ranking,
  profile,
}

final dashboardProvider =
    StateProvider<DashboardState>((ref) => DashboardState.home);
