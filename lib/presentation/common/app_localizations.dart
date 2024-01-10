import 'package:car_wayz/core/l10n/translations.dart';
import 'package:flutter/material.dart';

extension Strings on BuildContext {
  Translations get strings => Translations.of(this)!;
  String get locale => strings.localeName;
}
