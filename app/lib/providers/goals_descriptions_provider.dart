import 'dart:collection';
import 'package:goaly/domain/goal_type.dart';

final goalsDescriptions = UnmodifiableListView(const [
  GoalDescription('assets/goals/icons/gym.png', 'Go to the gym', GoalType.gym),
  GoalDescription(
      'assets/goals/icons/reading.png', 'Start reading', GoalType.read),
  GoalDescription('assets/goals/icons/biking.png', 'Bike more', GoalType.bike),
  GoalDescription(
      'assets/goals/icons/meditate.png', 'Meditate', GoalType.meditate),
  GoalDescription(
      'assets/goals/icons/board.png', 'Set up a custom goal', GoalType.custom)
]);

class GoalDescription {
  final GoalType goalType;
  final String assetPath;
  final String description;

  const GoalDescription(this.assetPath, this.description, this.goalType);
}
