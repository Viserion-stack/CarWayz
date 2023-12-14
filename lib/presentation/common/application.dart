import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:car_wayz/core/l10n/translations.dart';
import 'package:car_wayz/core/theme/theme.dart';
import 'package:car_wayz/presentation/components/navigation_hub.dart';
import 'package:car_wayz/presentation/router/app_route_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Application extends StatelessWidget {
  Application({
    required this.appTheme,
    required this.appRouteFactory,
    super.key,
  });

  final AppTheme appTheme;
  final AppRouteFactory appRouteFactory;

  final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
  late final _routerConfig = appRouteFactory.router(
    rootNavigatorKey: _rootNavigatorKey,
    shellNavigatorKey: _shellNavigatorKey,
  );

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: AdaptiveTheme(
        light: appTheme.theme(LightPalette()),
        dark: appTheme.theme(DarkPalette()),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => Translations.of(context)!.appTitle,
          localizationsDelegates: Translations.localizationsDelegates,
          supportedLocales: Translations.supportedLocales,
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: _routerConfig,
          builder: (context, child) => NavigationHub(
            rootNavigationKey: _rootNavigatorKey,
            childWidget: child!,
          ),
        ),
      ),
    );
  }
}
