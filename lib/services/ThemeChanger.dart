import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getThemeBrightness() => _themeData.brightness;

  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }
}
