import 'package:flutter/material.dart';

class AppLocalizations {
  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  static const List<String> supportedLanguages = ['en', 'fr', 'ar'];

  static Future<AppLocalizations> load(Locale locale) async {
    // Load your language files (e.g., en.json, fr.json)
    // This is just a simple example; you'd use the Flutter intl or similar package for this
    return AppLocalizations();
  }

  String translate(String key) {
    // Return translated text based on key
    return key; // Placeholder, replace with actual translation logic
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
