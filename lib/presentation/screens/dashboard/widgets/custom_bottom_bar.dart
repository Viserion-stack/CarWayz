import 'package:car_wayz/export.dart';

class CustomBottomBar extends ConsumerStatefulWidget {
  const CustomBottomBar({super.key});

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends ConsumerState<CustomBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    AppState status = AppState.home;
    switch (index) {
      case 0:
        status = AppState.home;
      case 1:
        status = AppState.splash;

      case 2:
        status = AppState.settings;
      case 3:
        status = AppState.add;
    }
    ref.read(appProvider.notifier).update((state) => state = status);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        //splashFactory: NoSplash.splashFactory,
      ),
      child: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'splash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'add',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        onTap: _onItemTapped,
      ),
    );
  }
}
