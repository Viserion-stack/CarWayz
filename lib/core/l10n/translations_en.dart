import 'translations.dart';

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([super.locale = 'en']);

  @override
  String get appTitle => 'Application';

  @override
  String get splash => 'Splash';

  @override
  String get dashboardProfile => 'Profile';

  @override
  String get dashboardHome => 'Home';
}
