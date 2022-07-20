// ignore_for_file: constant_identifier_names

const String english = 'en';
const String arabic = 'ar';

enum LanguageType { ENGLISH, ARABIC }

extension xLanguageType on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return english;
      case LanguageType.ARABIC:
        return arabic;
    }
  }
}
