import 'package:flutter/material.dart';
ThemeData apptheme()
{
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.indigo,
    textButtonTheme: textbuttontheme(),
    inputDecorationTheme: inputdecorationtheme(),
    appBarTheme: appbartheme(),
  );
}

appbartheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black)
  );
}

inputdecorationtheme() {
  OutlineInputBorder outlineInputBorder=OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    gapPadding: 10,
    borderSide: BorderSide(color: Colors.grey),
  );
  return InputDecorationTheme(
    border: outlineInputBorder
  );
}


textbuttontheme() {
  return TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
      textStyle: MaterialStateProperty.all(TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600
      )),
      foregroundColor: MaterialStateProperty.all(Colors.indigo),
      backgroundColor: MaterialStateProperty.all(Colors.white),
    )
  );
}