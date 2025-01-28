import 'package:flutter/material.dart';

class MoodFormProvider with ChangeNotifier {
  double _stressLevel = 50.0;
  double _selfEsteem = 50.0;
  String _notes = '';
    TextEditingController _notesController = TextEditingController(); // Add this line


  // Getter methods
  double get stressLevel => _stressLevel;
  double get selfEsteem => _selfEsteem;
  String get notes => _notes;
    TextEditingController get notesController => _notesController; // Getter for the controller


  // Update methods
  void updateStressLevel(double value) {
    _stressLevel = value;
    notifyListeners();
  }

  void updateSelfEsteem(double value) {
    _selfEsteem = value;
    notifyListeners();
  }

  void updateNotes(String value) {
    _notes = value;
    notifyListeners();
  }

  // A computed method to check if the form is valid
  bool get isFormValid {
    return _stressLevel != 50.0 && _selfEsteem != 50.0 && _notes.isNotEmpty;
  }
}
