/**
 * Created by Mahmud Ahsan
 * https://github.com/mahmudahsan
 */
import 'package:flutter/material.dart';

class UI with ChangeNotifier {
  double _setFontSizeByUser = 0.5;

  set dealWithFontSizeByUser(newValue) {
    _setFontSizeByUser = newValue;
    notifyListeners();
  }

  double get dealWithFontSizeByUser => _setFontSizeByUser * 30;

  double get sliderFontSizeFromUser => _setFontSizeByUser;
}
