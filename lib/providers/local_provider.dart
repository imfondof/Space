import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  Locale _locale = const Locale("zh");

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }
}
