import 'package:flutter/material.dart';

const largeTextSize = 26;
const mediumTextSize = 20;
const smallTextSize = 16;

const String fontNameDefault = 'Quicksand';
const String fontNameTitle = '';

ThemeData basisTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.teal.shade700,
      scaffoldBackgroundColor: Colors.lightBlue,
      fontFamily: fontNameDefault,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
            color: Color.fromARGB(255, 34, 51, 59),
            fontWeight: FontWeight.w700),
        headlineLarge:
            TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade700,
          // foregroundColor: Colors.white,
          fixedSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontSize: 18, fontFamily: 'Quicksand'),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          //foregroundColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 15, decoration: TextDecoration.underline),
        ),
      ),
    );
