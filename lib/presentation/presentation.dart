import 'package:car_wayz/core/app_logger/app_logger.dart';
import 'package:car_wayz/core/theme/theme.dart';
import 'package:car_wayz/presentation/common/application.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/presentation/injector_container.dart' as di;

Future<void> runApplication() async {
  await di.init(
    apiUrl: '',
  );

  _runAppLogger();

  runApp(
    Application(
      appTheme: AppTheme(),
    ),
  );
}

void _runAppLogger() {
  AppLogger.instance().configure(
    level: kDebugMode ? AppLogger.levelAll : AppLogger.levelSevere,
  );

  if (kDebugMode) {
    AppLogger.instance().enableConsoleOutput();
  }

  FlutterError.onError = (details) => logSevere(
        'FlutterError caught in app',
        details.exception,
        details.stack,
      );

  AppLogger.instance().output(
    (entry) {
      if (entry.error != null) {
        // for example log to firebase
      }
    },
  );
}
