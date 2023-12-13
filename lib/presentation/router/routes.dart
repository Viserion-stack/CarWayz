import 'package:car_wayz/export.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppState.home:
      return [HomeScreen.page()];
    case AppState.splash:
      return [SplashScreen.page()];
    case AppState.settings:
      return [AddScreen.page()];
    case AppState.add:
      return [AddScreen.page()];
  }
}
