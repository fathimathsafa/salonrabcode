import 'package:flutter/material.dart';

class OwnerBottomNavigationController with ChangeNotifier{
    int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}