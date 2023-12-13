import 'translations.dart';

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Application';

  @override
  String get splash => 'Splash';

  @override
  String get dashboardProfile => 'Profile';

  @override
  String get dashboardHome => 'Home';
}
