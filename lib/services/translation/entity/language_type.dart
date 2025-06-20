import 'dart:ui';

enum LanguageType {
  en,
  ru;

  Locale toLocale() {
    return _languageTypeToLocaleMap[this]!;
  }

  static LanguageType fromLocale(Locale locale) {
    return _localeToLanguageTypeMap[locale.languageCode]!;
  }
}

final _languageTypeToLocaleMap = {
  LanguageType.en: const Locale('en'),
  LanguageType.ru: const Locale('ru'),
};

final _localeToLanguageTypeMap = _languageTypeToLocaleMap
    .map((key, value) => MapEntry(value.languageCode, key));
