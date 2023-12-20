import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/friends/friends_screen.dart';
import 'package:car_wayz/presentation/screens/profile/profile_screen.dart';
import 'package:car_wayz/presentation/screens/ranking/ranking_screen.dart';

import '../screens/friends/car_community_detail_screen.dart';

List<Page<dynamic>> onGenerateDashboardViewPages(
  DashboardState state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case DashboardState.home:
      return [HomeScreen.page()];
    case DashboardState.friends:
      return [FriendsScreen.page()];
    case DashboardState.ranking:
      return [RankingScreen.page()];
    case DashboardState.profile:
      return [ProfileScreen.page()];
    case DashboardState.communityDetail:
      return [CommunityScreen.page()];
  }
}
