import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_type.dart';
import 'package:goaly/extensions/goal_type/goal_type_extensions.dart';

class AddGoalModel {
  final GoalType goalType;
  final String? _title;
  final List<GoalOccurrence> occurrences;

  String get title => _title ?? goalType.toReadable();

  AddGoalModel({
    required this.goalType,
    required String? title,
    this.occurrences = const [],
  }) : _title = title;

  Map<String, dynamic> toMap() {
    return {
      'goalType': goalType.name,
      'title': _title,
      'occurrences': occurrences.map((occurrence) => occurrence.toMap()).toList(),
    };
  }
}
