import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';

class SelectedWeekDaysProvider extends ChangeNotifier {
  final List<WeekDays> _selectedDays = [];

  List<WeekDays> get selectedDays => _selectedDays;

  void toggleDay(WeekDays day) {
    if (_selectedDays.contains(day)) {
      _selectedDays.remove(day);
    } else {
      _selectedDays.add(day);
    }
    notifyListeners();
  }

  bool containsDay(WeekDays day) => _selectedDays.contains(day);
}