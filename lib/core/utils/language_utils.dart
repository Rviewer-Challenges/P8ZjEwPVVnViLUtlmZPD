import 'dart:io';

String getLocale() {
  final String defaultLocale = Platform.localeName;
  String language = "en";
  if (defaultLocale == "es") {
    language = "es";
  }
  return language;
}
