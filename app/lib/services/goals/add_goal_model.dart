import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/domain/goal_type.dart';

class AddGoalModel {
  final GoalTimeOfDay timeOfDay;
  final GoalFrequency frequency;
  final GoalType goalType;
  final String? title;

  const AddGoalModel({
    required this.timeOfDay,
    required this.frequency,
    required this.title,
    required this.goalType,
  });

  Map<String, String?> toMap() {
    return {
      'timeOfDay': timeOfDay.name,
      'frequency': frequency.name,
      'title': title,
      'goalType': goalType.name,
    };
  }
}
