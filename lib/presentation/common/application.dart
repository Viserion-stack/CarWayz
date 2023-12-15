import 'package:car_wayz/export.dart';

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
          scaffoldMessengerKey: scaffoldKey,
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
