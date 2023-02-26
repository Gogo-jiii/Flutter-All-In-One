import 'dart:ui';
import 'package:flutter/material.dart';

class Styles {
  static final Styles _instance = Styles._internal();

  factory Styles() {
    return _instance;
  }

  Styles._internal() {
    // initialization logic
  }

  Color _primaryColor = Colors.lightBlue;
  Color _primaryBlackColor = Colors.black;
  Color _whiteColor = Colors.white;
  bool _isDarkTheme = false;

  Color getDropDownButtonBackgroundColor() {
    return _isDarkTheme ? _primaryBlackColor : Colors.green;
  }

  Color getDropDownButtonIconColor() {
    return _isDarkTheme ? _whiteColor : Colors.green;
  }

  Color getBorderColor() {
    return _isDarkTheme ? _whiteColor : _primaryBlackColor;
  }

  Color getSliderActiveColor() {
    return _isDarkTheme ? _primaryBlackColor : Colors.green;
  }

  Color? getSliderInActiveColor() {
    return _isDarkTheme ? _whiteColor : Colors.grey;
  }

  Color? getSliderThumbColor() {
    return _isDarkTheme ? _primaryBlackColor : Colors.orange;
  }

  Color getTextColor() {
    return _isDarkTheme ? _whiteColor : _primaryBlackColor;
  }

  Color getAlertDialogBackgroundColor() {
    return _isDarkTheme ? _primaryBlackColor : _whiteColor;
  }

  Color getAlertDialogTextColor() {
    return _isDarkTheme ? _whiteColor : _primaryBlackColor;
  }

  Color getCardColor() {
    return _isDarkTheme ? _primaryBlackColor : _whiteColor;
  }

  Color getButtonColor() {
    return _isDarkTheme ? _primaryBlackColor : _primaryColor;
  }

  ThemeData themeData(bool isDarkTheme, BuildContext context) {
    _isDarkTheme = isDarkTheme;

    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColor: isDarkTheme ? _primaryBlackColor : _primaryColor,
      fontFamily: 'Georgia',
    );
  }
}
