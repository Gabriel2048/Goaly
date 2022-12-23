import 'package:goaly/domain/goal_time_of_day.dart';

class Goal {
  final GoalTimeOfDay goalTimeOfDay;
  final String? description;

  const Goal({required this.goalTimeOfDay, this.description});

  Map<String, String> toMap() {
    return {
      'goalTimeOfDay': goalTimeOfDay.name,
      'description': description.toString(),
    };
  }
}
