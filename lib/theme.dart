import 'package:flutter/material.dart';
ThemeData apptheme()
{
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.indigo,
      elevatedButtonTheme: elevatedButtonTheme(),
    textButtonTheme: textbuttontheme(),
    inputDecorationTheme: inputdecorationtheme(),
    appBarTheme: appbartheme(),
    textTheme: textTheme()
  );
}

elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 30),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: MaterialStateProperty.all(Colors.pink),
    ),
  );
}

textTheme() {
  return TextTheme(
    bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
  );
}

appbartheme() {
  return AppBarTheme(
    elevation: 0,
    color: Colors.white,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),

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