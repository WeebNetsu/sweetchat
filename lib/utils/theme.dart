import 'package:flutter/material.dart';

// light theme
// Color(0xALPHA(FF)COLOR(FC0F7A))
const primaryColor = Color(0xFF03F085);
const secondaryColorLightTheme = Color(0xFFFC0F7A);
const textColorLightTheme = Color(0xFF000000);

// dark theme
const secondaryColorDarkTheme = Color(0xFFFEA1CB);
const textColorDarkTheme = Color(0xFFFFFFFF);
// this is white by default in light theme
const bgColorDarkTheme = Color(0xFF444444);

final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  colorScheme: ThemeData.light()
      .colorScheme
      .copyWith(secondary: secondaryColorLightTheme),
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  colorScheme:
      ThemeData.dark().colorScheme.copyWith(secondary: secondaryColorDarkTheme),
);
