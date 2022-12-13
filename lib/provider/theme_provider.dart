import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color kWhite = Colors.white;
  Color kBlack = Colors.black;
  Color kPrimary = Colors.teal;

  ThemeData _theme = ThemeData.dark();

  ThemeData get theme => _theme;





  void changeTheme() {
    final isDark = _theme == ThemeData.dark();
    if (isDark) {
      _theme = ThemeData.light();
      print('light theme ${_theme.toString()}');
       kWhite = Colors.white;
       kBlack = Colors.black;
      notifyListeners();
    } else {
      _theme = ThemeData.dark();
      kWhite = Colors.black;
      kBlack = Colors.white;
      print('dark theme ${_theme.toString()}');
      notifyListeners();
    }
    print(kWhite);
    print(kBlack);
    notifyListeners();
  }
}
