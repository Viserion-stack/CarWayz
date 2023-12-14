import 'package:car_wayz/presentation/common/app_provider/app_provider.dart';
import 'package:car_wayz/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:car_wayz/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppState.login:
      return [LoginScreen.page()];
    case AppState.dashboard:
      return [DashboardScreen.page()];
  }
}
