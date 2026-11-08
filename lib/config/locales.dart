import 'package:flutter/material.dart' show Locale;

// This file defines the supported locales for the application.
Locale englishLocale = Locale('en');
Locale russianLocale = Locale('ru');
Locale uzbekLatinLocale = Locale.fromSubtags(
  languageCode: 'uz',
  scriptCode: 'Latn',
);
Locale uzbekCyrillicLocale = Locale.fromSubtags(
  languageCode: 'uz',
  scriptCode: 'Cyrl',
);

// Define the list of supported languages and their locales
final Map<String, Locale> supportedLanguagesMap = {
  "O’zbek tili": uzbekLatinLocale,
  'Русский язык': russianLocale,
  'English': englishLocale,
  "Узбекча": uzbekCyrillicLocale,
};

// This list contains all the supported locales for the application.
List<Locale> supportedLocales = [
  englishLocale,
  russianLocale,
  uzbekLatinLocale,
  uzbekCyrillicLocale,
];
