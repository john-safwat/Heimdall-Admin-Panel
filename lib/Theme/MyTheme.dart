import 'package:flutter/material.dart';

class MyTheme {
  static const Color black = Color(0xFF2F2F2F);
  static const Color red = Color(0xFFEC704B);
  static const Color pink = Color(0xFFDCC1FF);
  static const Color yellow = Color(0xFFF5F378);
  static const Color cafe = Color(0xFFFFF1D4);

  static ThemeData theme = ThemeData(
    // set the scaffold background color with the color white
    scaffoldBackgroundColor: black,
    // set the primary color with the color black
    primaryColor: cafe,
    // set the accent color
    secondaryHeaderColor: yellow,

    appBarTheme: const AppBarTheme(
      backgroundColor: cafe,
      foregroundColor: black,
      centerTitle: true,
      surfaceTintColor: cafe,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: cafe,
    ),
    // set the text styles
    textTheme: const TextTheme(
        titleLarge: TextStyle(color: cafe),
        titleMedium: TextStyle(color: cafe),
        titleSmall: TextStyle(color: cafe),
        labelLarge: TextStyle(color: cafe),
        labelMedium: TextStyle(color: cafe),
        labelSmall: TextStyle(color: cafe),
        bodyLarge: TextStyle(color: cafe),
        bodyMedium: TextStyle(color: cafe),
        bodySmall: TextStyle(color: cafe)),
    // set the elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(cafe),
            foregroundColor: MaterialStateProperty.all(black),
            elevation: MaterialStateProperty.all(0),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: black)))),
    // set the dialog background color
    dialogTheme: const DialogTheme(
      backgroundColor: black,
    ),

    // set the text from filed decoration
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(color: red, fontSize: 12),
      iconColor: cafe,
      contentPadding: const EdgeInsets.all(15),
      hintStyle: const TextStyle(color: cafe, fontSize: 16),
      prefixIconColor: cafe,
      suffixIconColor: cafe,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: cafe,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: cafe,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: cafe,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          )),
    ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: cafe,
          foregroundColor: black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          )
      )
  );
}
