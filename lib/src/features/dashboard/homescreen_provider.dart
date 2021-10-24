import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider() {}

  bool isDarkMode = false;

  void updateTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
