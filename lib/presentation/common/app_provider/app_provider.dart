import '../../../export.dart';

enum AppState {
  home,
  splash,
  add,
  settings,
}

final appProvider = StateProvider<AppState>((ref) => AppState.home);
