


import 'package:flutter/material.dart';


class AppController extends ChangeNotifier {
  int bottomSelectedIndex = 0;

  void onBottomSelectedIndex(int index) {
    bottomSelectedIndex = index;
    notifyListeners();
  }








  Map<String, dynamic> filterBody = {};

  void setFilter(Map<String, dynamic> body) {
    filterBody = body;
    notifyListeners();
  }



}
