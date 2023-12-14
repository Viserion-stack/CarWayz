import 'package:car_wayz/export.dart';

enum AppState {
  login,
  dashboard,
}

final appProvider = StateProvider<AppState>((ref) => AppState.login);
