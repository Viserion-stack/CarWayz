import 'package:car_wayz/data/local/adapter/shared_preferences_adapter.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

extension DataInjector on GetIt {
  Future<void> registerData({required String apiUrl}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    // ignore: avoid_single_cascade_in_expression_statements
    this
      ..registerLazySingleton<SharedPreferencesAdapter>(
        () => SharedPreferencesAdapter(sharedPreferences: sharedPreferences),
      );
  }
}
