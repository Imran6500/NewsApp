import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(color: Color(0xff363849), centerTitle: true),
    colorScheme: const ColorScheme(
      primary: darkPrimaryColor,
      onPrimary: darkPrimaryColor,
      primaryContainer: darkPrimaryConatinerColor,
      onPrimaryContainer: darkPrimaryConatinerColor,
      secondary: Colors.yellow,
      onSecondary: Colors.yellow,
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.dark,
      background: darkBackgroundColor,
      onBackground: darkBackgroundColor,
      surface: darkTextColor,
      onSurface: darkTextColor,
    ),
    textTheme: const TextTheme(labelSmall: TextStyle(color: Colors.white30)));
