import 'package:flutter/material.dart';

import 'button_settings.dart';

class ButtonThemeController {
  static ButtonSettings _defaultSettings =  ButtonSettings(
    height: 48.0,
    width: double.infinity,
    takeFullSpace: true,
    splashColor: Colors.black12,
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    disableBackgroundColor: Colors.grey,
    disableForegroundColor: Colors.white70,
    borderColor: Colors.transparent,
    borderWidth: 0.0,
    borderRadius: 8.0,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    margin: EdgeInsets.zero,
    elevation: 2.0,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    iconSize: 24.0,
    loaderWidth: 2.0,
    loaderSize: 24.0,
  );

  static void initialize(ButtonSettings settings) {
    _defaultSettings = settings;
  }

  static ButtonSettings get defaultSettings => _defaultSettings;
}