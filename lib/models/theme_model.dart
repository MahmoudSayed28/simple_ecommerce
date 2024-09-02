import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  Brightness theme=Brightness.light;
  convertLightMode(){
theme=Brightness.dark;
notifyListeners();
  }
   convertDarkMode(){
theme=Brightness.light;
notifyListeners();
  }
  
}