import 'package:goaly/domain/goal_time_of_day.dart';

class Goal {
  final GoalTimeOfDay goalTimeOfDay;
  final String title;
  final String? description;

  const Goal(
      {required this.goalTimeOfDay, required this.title, this.description});

  Map<String, String> toMap() {
    return {
      'goalTimeOfDay': goalTimeOfDay.name,
      'title': title,
      'description': description.toString(),
    };
  }

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      goalTimeOfDay: GoalTimeOfDay.values.byName(map['goalTimeOfDay']),
      title: map['title'],
      description: map['description'],
    );
  }
}
