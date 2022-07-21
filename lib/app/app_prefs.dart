import 'package:clean_arch/prsentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String keyLanguage = 'keyLanguage';
const String keyIsLoggedIn = 'keyIsLoggedIn';
const String keyOnboardingScreenViewed = 'keyOnboardingScreenViewed';

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

  void setOnboardingScreenViewed() => _prefs.setBool(keyOnboardingScreenViewed, true);

  void setIsLoggedIn(bool isLoggedIn ) => _prefs.setBool(keyIsLoggedIn, isLoggedIn);

  bool isLoggedIn() => _prefs.getBool(keyIsLoggedIn) ?? false;

  bool isOnboardingScreenViewed() => _prefs.getBool(keyOnboardingScreenViewed) ?? false;
}
