import 'package:flutter/material.dart';

class PageControllers extends ChangeNotifier {
  int _bottomNavIndex = 0;

  int get bottomNavIndex => _bottomNavIndex;

  setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }
}
