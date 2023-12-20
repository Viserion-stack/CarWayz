import 'package:car_wayz/export.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}
