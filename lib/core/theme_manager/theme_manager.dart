import 'package:flutter/material.dart';

ThemeData getDarkMode() {
  return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.grey[900],
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          actionsIconTheme: const IconThemeData(color: Colors.white,)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
      ));
}

ThemeData getLightMode() {
  return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
              fontSize: 25
          ),
          elevation: 0,
          centerTitle: true,
          actionsIconTheme: IconThemeData(color: Colors.black)),
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black26,
      ));
}
