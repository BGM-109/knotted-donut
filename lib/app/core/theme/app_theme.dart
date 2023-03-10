import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTheme {
  /// for getting light theme
  ThemeData get lightTheme {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    return ThemeData();
  }
}

/// for providing app theme [AppTheme]
final appThemeProvider = Provider<AppTheme>((_) => AppTheme());
