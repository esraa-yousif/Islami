import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() {
    getThemeMode();
    getLanguage();
  }

  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;
  String get backGroundImageName => isDark ? 'dark_bg' : 'default_bg';
  String get headSebhaName => isDark ? 'head_sebha_dark' : 'head_sebha_logo';
  String get bodySebhaName => isDark ? 'body_sebha_dark' : 'body_sebha_logo';
  void changeTheme(selectedTheme) {
    themeMode = selectedTheme;
    setThemeMode(themeMode);
    notifyListeners();
  }

  void changeLanguage(selectedLanguage) {
    languageCode = selectedLanguage;
    setLanguage(languageCode);
    notifyListeners();
  }

  void setThemeMode(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (theme == ThemeMode.light) {
      prefs.setString('theme', 'light');
    } else {
      prefs.setString('theme', 'dark');
    }
  }

  void getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String cachedTheme = prefs.getString('theme') ?? 'light';

    if (cachedTheme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (language == 'en') {
      prefs.setString('language', 'en');
    } else {
      prefs.setString('language', 'ar');
    }
  }

  void getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String cachedLanguage = prefs.getString('language') ?? 'en';

    if (cachedLanguage == 'en') {
      languageCode = 'en';
    } else {
      languageCode = 'ar';
    }
    notifyListeners();
  }
}
