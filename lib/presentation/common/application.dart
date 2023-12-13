import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:car_wayz/core/l10n/translations.dart';
import 'package:car_wayz/core/theme/theme.dart';
import 'package:car_wayz/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Application extends StatelessWidget {
  const Application({
    required this.appTheme,
    super.key,
  });

  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AdaptiveTheme(
        light: appTheme.theme(LightPalette()),
        dark: appTheme.theme(DarkPalette()),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => Translations.of(context)!.appTitle,
          localizationsDelegates: Translations.localizationsDelegates,
          supportedLocales: Translations.supportedLocales,
          theme: theme,
          darkTheme: darkTheme,
          home: const DashboardScreen(),
        ),
      ),
    );
  }
}
