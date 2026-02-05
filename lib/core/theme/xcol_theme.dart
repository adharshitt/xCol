import 'package:flutter/material.dart';

class XColTheme {

  static ThemeData get darkTheme => ThemeData(

    brightness: Brightness.dark,

    primaryColor: const Color(0xFF00FF88),

    scaffoldBackgroundColor: const Color(0xFF121212),

    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor: const Color(0xFF00FF88),

        foregroundColor: Colors.black,

      ),

    ),

  );

}

