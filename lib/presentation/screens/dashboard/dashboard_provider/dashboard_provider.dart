import 'package:car_wayz/export.dart';

enum DashboardState {
  home,
  friends,
  ranking,
  profile,
  communityDetail,
}

final dashboardProvider =
    StateProvider<DashboardState>((ref) => DashboardState.home);
