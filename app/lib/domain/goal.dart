import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/domain/goal_type.dart';

class Goal {
  final String id;
  final GoalTimeOfDay timeOfDay;
  final GoalFrequency frequency;
  final GoalType goalType;
  final String? title;

  const Goal({
    required this.id,
    required this.timeOfDay,
    required this.frequency,
    required this.title,
    required this.goalType,
  });

  factory Goal.fromMap(
    Map<String, dynamic> properties,
    String id,
  ) {
    return Goal(
      id: id,
      timeOfDay: GoalTimeOfDay.values.byName(properties['timeOfDay']),
      frequency: GoalFrequency.values.byName(properties['frequency']),
      title: properties['title'],
      goalType: GoalType.values.byName(properties['goalType']),
    );
  }
}
