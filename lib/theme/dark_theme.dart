import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: const Color(0xFFFEB800),
  secondaryHeaderColor: const Color(0xFF010d75),
  disabledColor: const Color(0xFFE7E7E7),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFE7E7E7),
  cardColor: Colors.black,
  shadowColor: Colors.white.withOpacity(0.03),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFFFEB800))),
  colorScheme: const ColorScheme.dark(primary: Color(0xFFFEB800), secondary: Color(0xFFFEB800)).copyWith(error: const Color(0xFFFF4441)),
  popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF1C1B19), surfaceTintColor: Color(0xFF1C1B19)),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white10),
  floatingActionButtonTheme: FloatingActionButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)), elevation: 5.5),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black, height: 60, padding: EdgeInsets.symmetric(vertical: 5)),
  dividerTheme: const DividerThemeData(thickness: 0.2, color: Color(0xFFE7E7E7)),
);