import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _currentTheme;

  ThemeProvider(ThemeData initialTheme) {
    _currentTheme = initialTheme;
  }

  ThemeData? get currentTheme => _currentTheme;

  void setTheme(ThemeData newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }
}
