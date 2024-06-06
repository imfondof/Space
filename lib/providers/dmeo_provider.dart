import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String data = "default";

  void updateData(String newData) {
    data = newData;
    notifyListeners();
  }
}
