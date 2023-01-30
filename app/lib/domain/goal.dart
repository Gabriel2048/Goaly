import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/domain/goal_type.dart';

class Goal {
  final GoalTimeOfDay timeOfDay;
  final GoalFrequency frequency;
  final GoalType goalType;
  final String? title;

  const Goal(
      {required this.timeOfDay,
      required this.frequency,
      required this.title,
      required this.goalType});

  Map<String, String?> toMap() {
    return {
      'timeOfDay': timeOfDay.name,
      'frequency': frequency.name,
      'title': title,
      'goalType': goalType.name,
    };
  }

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      timeOfDay: GoalTimeOfDay.values.byName(map['timeOfDay']),
      frequency: GoalFrequency.values.byName(map['frequency']),
      title: map['title'],
      goalType: GoalType.values.byName(map['goalType']),
    );
  }
}
