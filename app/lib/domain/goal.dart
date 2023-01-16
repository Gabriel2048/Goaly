import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';

class Goal {
  final GoalTimeOfDay timeOfDay;
  final GoalFrequency frequency;
  final String? title;
  final String? description;

  const Goal(
      {required this.timeOfDay,
      required this.frequency,
      required this.title,
      this.description});

  Map<String, String?> toMap() {
    return {
      'timeOfDay': timeOfDay.name,
      'frequency': frequency.name,
      'title': title,
      'description': description.toString(),
    };
  }

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      timeOfDay: GoalTimeOfDay.values.byName(map['timeOfDay']),
      frequency: GoalFrequency.values.byName(map['frequency']),
      title: map['title'],
      description: map['description'],
    );
  }
}
