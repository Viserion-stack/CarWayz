import 'translations.dart';

/// The translations for Polish (`pl`).
class TranslationsPl extends Translations {
  TranslationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Application';

  @override
  String get splash => 'Splash';

  @override
  String get dashboardProfile => 'Profil';

  @override
  String get dashboardHome => 'Home';

  @override
  String get loginButtonText => 'Zaloguj';

  @override
  String get loginSignWith => 'Zaloguj przez';

  @override
  String get createAccountButtonText => 'Utwórz konto';

  @override
  String get password => 'Hasło';

  @override
  String get email => 'Email';

  @override
  String get confirmPassword => 'Potwierdź hasło';

  @override
  String get singUpButtonText => 'Zarejestruj się';

  @override
  String get createCommunityText => 'Stwórz swoją społeczność samochodową!';

  @override
  String get signOut => 'Wyloguj';

  @override
  String get create => 'Utwórz';

  @override
  String get profileSettingsText => 'Ustawienia konta';

  @override
  String get loginOr => '- LUB -';
}
