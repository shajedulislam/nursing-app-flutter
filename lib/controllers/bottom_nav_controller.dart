import 'package:flutter/material.dart';

class BottomNavController with ChangeNotifier {
  int selectedItem = 0;

  void changeItemIndex(index) {
    selectedItem = index;
    notifyListeners();
  }
}
