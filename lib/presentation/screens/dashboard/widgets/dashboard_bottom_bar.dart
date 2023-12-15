import 'package:car_wayz/export.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class DashboardBottomBar extends ConsumerStatefulWidget {
  const DashboardBottomBar({super.key});

  @override
  DashboardBottomBarState createState() => DashboardBottomBarState();
}

class DashboardBottomBarState extends ConsumerState<DashboardBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    DashboardState status = DashboardState.home;
    switch (index) {
      case 0:
        status = DashboardState.home;
      case 1:
        status = DashboardState.friends;

      case 2:
        status = DashboardState.ranking;
      case 3:
        status = DashboardState.profile;
    }
    ref.read(dashboardProvider.notifier).update((state) => state = status);
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  static const cornerRadius = 16.0;
  static const itemsCount = 4;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: itemsCount,
      tabBuilder: (index, isActive) => NavBarIcon(
        index: index,
        isActive: isActive,
      ),
      activeIndex: _selectedIndex,
      onTap: (index) => _onItemTapped(index),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      backgroundColor: context.palette.cardColor,
    );
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    required this.index,
    required this.isActive,
    super.key,
  });

  final int index;
  final bool isActive;

  static const iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    var iconList = [
      Icons.home,
      Icons.people,
      Icons.star,
      Icons.person,
    ];
    return Icon(
      iconList[index],
      size: iconSize,
      color: isActive ? Colors.white : Colors.grey,
    );
  }
}
