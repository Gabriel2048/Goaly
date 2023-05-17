import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/domain/goal_type.dart';

class GoalFormProvider extends ChangeNotifier {
  late GoalType goalType;

  final List<WeekDays> _selectedDays = [];

  List<WeekDays> get selectedDays => _selectedDays;

  bool get hasTitleConfigurable => goalType == GoalType.custom;

  void setGoalType(GoalType goalType) {
    this.goalType = goalType;
  }

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
