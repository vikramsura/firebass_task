import 'package:flutter/material.dart';

class AppColors {
  static Color black = Colors.black;
  static Color blue = Colors.blue;
  static Color white = Colors.white;

}

class AppColor {
  static const Color primaryColor = Color(0xff000000);
  static const Color accentColor = Color(0xffffffff);

  static Color textColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static Color borderColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static Color iconColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static Color selectIconColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark ? Colors.white : Colors.black;
  }

  static Color unSelectIconColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark ? Colors.white : Colors.black;
  }
  static Color fieldBorderColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark ? Colors.white : Colors.black;
  }
}
