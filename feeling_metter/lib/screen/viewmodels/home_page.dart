import 'dart:async';  // I have added this line of import and the periodic method works so it's nessery to add it !
import 'package:feeling_metter/core/utils/date_helper.dart';
import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  String _currentTime = '';
  String _currentDayAndMonth = '';

  String get currentTime => _currentTime;
  String get currentDayAndMonth => _currentDayAndMonth;

  HomePageViewModel() {
    _updateDateAndTime();
  }

  void _updateDateAndTime() {
    // Get the current day and month
    _currentDayAndMonth = getCurrentDayAndMonth();

    // Get the current time with offset (e.g., 6 hours ahead for `11:53`)
    _currentTime = getCurrentTimeWithOffset(6); // Change 6 to the desired offset for your timezone

    notifyListeners();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentTime = getCurrentTimeWithOffset(6); // Adjusted time every second
      notifyListeners();
    });
  }
}
