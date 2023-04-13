import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

ThemeManager themeManager = ThemeManager();

class ThemeManager with ChangeNotifier {
  bool _isDarkMode = SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
  bool isDarkMode() => _isDarkMode;

  toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
