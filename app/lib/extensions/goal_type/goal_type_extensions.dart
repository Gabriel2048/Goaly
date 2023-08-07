import 'package:goaly/domain/goal_type.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';

extension GoalTypeExtension on GoalType {
  String toReadable() {
    return goalsDescriptions
        .firstWhere((element) => element.goalType == this)
        .description;
  }
}
