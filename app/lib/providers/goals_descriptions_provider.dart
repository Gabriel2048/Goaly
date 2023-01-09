import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal_type.dart';

final goalDescriptionProvider = Provider<Map<GoalType, GoalDescription>>((ref) {
  return const {
    GoalType.gym:
        GoalDescription('assets/goals/icons/gym.png', 'Go to the gym'),
    GoalType.custom:
        GoalDescription('assets/goals/icons/gym.png', 'Custom goal')
  };
});

class GoalDescription {
  final String assetPath;
  final String description;

  const GoalDescription(this.assetPath, this.description);
}
