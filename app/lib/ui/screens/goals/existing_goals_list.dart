import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/providers/goals_provider.dart';
import 'package:goaly/ui/screens/goals/existing_goal_card.dart';

class ExistingGoalsList extends StatelessWidget {
  const ExistingGoalsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final goalsStream = ref.watch(goalsProvider);
        return goalsStream.when(
          data: (data) => ListView.separated(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ExistingGoalCard(goal: data[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          ),
          error: (_, __) => const Placeholder(),
          loading: () => const CircularProgressIndicator(),
        );
      },
    );
  }
}
