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

  @override
  String get loginButtonText => 'Login';

  @override
  String get loginSignWithGoogle => 'Sign in with Google';

  @override
  String get createAccountButtonText => 'Create Account';

  @override
  String get password => 'Password';

  @override
  String get email => 'Email Address';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get singUpButtonText => 'Sign Up';

  @override
  String get createCommunityText => 'Create your car community!';

  @override
  String get signOut => 'Sign Out';

  @override
  String get create => 'Create';

  @override
  String get profileSettingsText => 'Profile Settings';
}
