import 'package:flutter/material.dart';

class CarouselProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notify widgets that the state has changed
  }
}
