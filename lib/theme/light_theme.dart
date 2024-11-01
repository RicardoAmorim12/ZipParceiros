import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: const Color(0xFF3FE539),
  secondaryHeaderColor: const Color(0xFF000743),
  disabledColor: const Color(0xFFE7E7E7),
  brightness: Brightness.light,
  hintColor: const Color(0xFFE7E7E7),
  cardColor: Colors.white,
  shadowColor: Colors.black.withOpacity(0.03),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF3FE539))),
  colorScheme: const ColorScheme.light(primary: Color(0xFFFEB800), secondary: Color(0xFFFEB800)).copyWith(error: const Color(0xFFFF4441)),
  popupMenuTheme: const PopupMenuThemeData(color: Colors.white, surfaceTintColor: Colors.white),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)), elevation: 5.5),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white, height: 60, padding: EdgeInsets.symmetric(vertical: 5)),
  dividerTheme: const DividerThemeData(thickness: 0.2, color: Color(0xFFE7E7E7)),
);