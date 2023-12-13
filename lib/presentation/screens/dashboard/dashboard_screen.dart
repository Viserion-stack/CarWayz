import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('dashboard'),
      ),
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final location = GoRouterState.of(context).matchedLocation;
  // if (location.startsWith(HomeScreen.routeName)) {
  //   return 0;
  // } else if (location.startsWith(ProfileScreen.routeName)) {
  //   return 1;
  // }

  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  // switch (index) {
  //   case 0:
  //     context.go(HomeScreen.routeName);
  //   case 1:
  //     context.go(ProfileScreen.routeName);
  //   case 2:
  //     context.go(HomeScreen.routeName);
  //   case 3:
  //     context.go(ProfileScreen.routeName);
  // }
}
