import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;
  String get headSebhaName => isDark ? 'head_sebha_dark' : 'head_sebha_logo';
  String get bodySebhaName => isDark ? 'body_sebha_dark' : 'body_sebha_logo';

  List<String> azkar = ['سبحان الله', 'الحمدلله', 'الله أكبر'];

  double angle = 0;
  int index = 0;
  int count = 0;

  SebhaProvider() {
    getThemeMode();
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

  void increment() {
    if (count < 33) {
      count++;
    } else {
      count = 0;
      index++;
      if (index == azkar.length) {
        index = 0;
      }
    }
    angle += 15;
    notifyListeners();
  }
}
