import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_type.dart';

class AddGoalModel {
  late final GoalType goalType;
  final String? title;
  final List<Frequency> frequency;

  AddGoalModel({
    required this.title,
    this.frequency = const [],
  });

  Map<String, String?> toMap() {
    return {
      'title': title,
      'goalType': goalType.name,
    };
  }

  AddGoalModel copyWith({
    String? title,
    List<Frequency>? frequency,
    GoalType? goalType,
  }) {
    return AddGoalModel(
      title: title ?? this.title,
      frequency: frequency ?? this.frequency,
    )..goalType = goalType ?? this.goalType;
  }
}
