import 'package:flutter_riverpod/flutter_riverpod.dart';

final addableGoalsProvider = Provider<List<AddableGoal>>((ref) {
  return List.unmodifiable(
    const [
      AddableGoal('assets/goals/icons/gym.png', 'Go to the gym'),
      AddableGoal('assets/goals/icons/gym.png', 'placeholder'),
    ],
  );
});

class AddableGoal {
  final String assetPath;
  final String description;

  const AddableGoal(this.assetPath, this.description);
}
