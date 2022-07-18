import 'package:clean_arch/prsentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyLanguage = 'keyLanguage';

class AppPreferences {
  final SharedPreferences _prefs;
  AppPreferences(this._prefs);

  String getAppLanguage() {
    String? language = _prefs.getString(keyLanguage);

    if (language == null || language.isEmpty) {
      return LanguageType.ENGLISH.getValue();
    }

    return language;
  }
}
