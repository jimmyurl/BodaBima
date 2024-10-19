import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    // Load the localization file from the "l10n" folder.
<<<<<<< HEAD
    String jsonString =
        await rootBundle.loadString('lib/l10n/app_${locale.languageCode}.arb');
=======
    String jsonString = await rootBundle
        .loadString('assets/translations/app_${locale.languageCode}.arb');
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // Fetch the translated string by key.
  String? translate(String key) {
    return _localizedStrings?[key];
  }

  // List supported locales.
  static List<Locale> getSupportedLocales() {
    return const [
      Locale('en', 'US'),
      Locale('sw', 'TZ'),
    ];
  }
}

// Localizations delegate class
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'sw'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
