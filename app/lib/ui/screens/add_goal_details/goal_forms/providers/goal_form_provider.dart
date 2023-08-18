import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_type.dart';
import 'package:goaly/services/goals/add_goal_model.dart';
import 'package:goaly/services/goals/goals_service.dart';

class GoalFormProvider extends ChangeNotifier {
  late GoalType goalType;
  String? title;
  final Map<WeekDays, TimeOfDay> _selectedDaysTime = {};

  // ignore: unused_field
  final GoalsService _goalsService;

  final defaultTime = const TimeOfDay(hour: 12, minute: 0);

  GoalFormProvider(this._goalsService);

  void setGoalType(GoalType goalType) {
    this.goalType = goalType;
  }

  void toggleDay(WeekDays day) {
    if (_selectedDaysTime.keys.contains(day)) {
      _selectedDaysTime.remove(day);
    } else {
      _selectedDaysTime[day] = defaultTime;
    }
    notifyListeners();
  }

  void setTime(TimeOfDay time, WeekDays? day) {
    if (day == null) {
      _selectedDaysTime.forEach((key, value) {
        _selectedDaysTime[key] = time;
      });
    } else {
      _selectedDaysTime[day] = time;
    }
    notifyListeners();
  }

  void setTitle(String? title) {
    this.title = title;
    notifyListeners();
  }

  Future<void> addGoal() {
    final occurrences = _selectedDaysTime.entries
        .map((entry) =>
            GoalOccurrence(weekDay: entry.key, timeOfDay: entry.value))
        .toList();

    final addGoalModel = AddGoalModel(
        goalType: goalType, title: title, occurrences: occurrences);

    return _goalsService.addGoal(addGoalModel);
  }

  bool get hasTitleConfigurable => goalType == GoalType.custom;

  bool containsDay(WeekDays day) => _selectedDaysTime.keys.contains(day);

  List<WeekDays> get selectedDays => _selectedDaysTime.keys.toList();

  UnmodifiableMapView<WeekDays, TimeOfDay> get selectedDaysTime =>
      UnmodifiableMapView(_selectedDaysTime);
}
