import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  static const Color background = Colors.white;
  static const Color primary = Color.fromRGBO(40, 40, 40, 1.0);
  static const Color accent = Color.fromRGBO(67, 150, 203, 1.0);
  static const Color avatar = AppTheme.accent;
  static const Color text = AppTheme.primary;
  static const Color hint = Color.fromRGBO(140, 140, 140, 1.0);
  static const Color border = Color.fromRGBO(242, 242, 242, 1.0);
  static const Color success = Colors.green;
  static const Color danger = Colors.red;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;
}

ThemeData appThemeData = ThemeData(
  fontFamily: 'gilroy',
  scaffoldBackgroundColor: AppTheme.background,
  primaryColor: AppTheme.primary,
  accentColor: AppTheme.accent,
  dividerTheme: DividerThemeData(
    color: AppTheme.border,
    thickness: 2.0,
  ),
  textTheme: const TextTheme(
    headline4: TextStyle(
      color: AppTheme.text,
      fontWeight: FontWeight.w900,
      fontSize: 40.0,
      letterSpacing: -1.5,
    ),
    headline6: TextStyle(
      color: AppTheme.text,
      fontWeight: FontWeight.w900,
      fontSize: 22.0,
    ),
    subtitle2: TextStyle(
      color: AppTheme.hint,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppTheme.primary,
    disabledColor: Colors.white.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    colorScheme: ColorScheme.dark(),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppTheme.hint,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppTheme.accent,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppTheme.border),
    ),
  ),
);
