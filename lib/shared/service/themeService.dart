import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
  );

  Future<ThemeData> fetchAndApplyTheme() async {
    try {
      await _remoteConfig.fetch();
      await _remoteConfig.fetchAndActivate();
      bool isDarkModeEnabled = _remoteConfig.getBool('is_dark_mode_enabled');
      if (isDarkModeEnabled) {
        return ThemeData.dark(); // Return the dark theme
      } else {
        return ThemeData.light(); // Return the light theme
      }
    } catch (e) {
      print("Error fetching theme configuration: $e");
      return ThemeData.dark(); // Return the dark theme
    }
  }

  ThemeData getTheme() {
    bool isDarkModeEnabled = _remoteConfig.getBool('is_dark_mode_enabled');
    return isDarkModeEnabled ? _darkTheme : _lightTheme;
  }

}
