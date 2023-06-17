import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_type.dart';

class AddGoalModel {
  final GoalType goalType;
  final String? title;
  final List<Frequency> frequency;

  AddGoalModel({
    required this.goalType,
    required this.title,
    this.frequency = const [],
  });

  Map<String, String?> toMap() {
    return {
      'title': title,
      'goalType': goalType.name,
    };
  }
}
