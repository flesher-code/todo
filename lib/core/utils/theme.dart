import 'package:flutter/material.dart';


final colorThemeApp = ColorScheme.fromSeed(seedColor: Colors.green);

final ThemeData appTheme = ThemeData(
  colorScheme: colorThemeApp,

  appBarTheme: AppBarTheme(
    backgroundColor: colorThemeApp.onInverseSurface,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: colorThemeApp.primary,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    )
  )
);
