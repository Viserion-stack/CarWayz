import 'package:car_wayz/data/data_injector.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> init({
  required String apiUrl,
}) async {
  await injector.registerData(apiUrl: apiUrl);
}
