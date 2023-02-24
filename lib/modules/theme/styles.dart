import 'dart:ui';
import 'package:flutter/material.dart';

class Styles {
  static const Color _primaryColor = Colors.lightBlue;
  static const Color _primaryBlackColor = Colors.black;
  static const Color _whiteColor = Colors.white;
  static bool _isDarkTheme = false;

  static Color getTextColor(){
    return _isDarkTheme ? _whiteColor : _primaryBlackColor;
  }

  static Color getCardColor(){
    return _isDarkTheme ? _primaryBlackColor : _whiteColor;
  }

  static Color getButtonColor(){
    return _isDarkTheme ? _primaryBlackColor : _primaryColor;
  }

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    _isDarkTheme = isDarkTheme;

    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColor: isDarkTheme ? _primaryBlackColor : _primaryColor,
      fontFamily: 'Georgia',
    );
  }
}
