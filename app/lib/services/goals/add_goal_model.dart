import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_type.dart';

class AddGoalModel {
  final GoalType goalType;
  final String? title;
  final List<GoalOccurrence> occurrences;

  AddGoalModel({
    required this.goalType,
    required this.title,
    this.occurrences = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'goalType': goalType.name,
      'title': title,
      'occurrences': occurrences.map((occurrence) => occurrence.toMap()).toList(),
    };
  }
}
