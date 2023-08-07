import 'package:flutter/material.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/goals/goals_service.dart';
import 'package:goaly/ui/screens/goals/existing_goal_card.dart';
import 'package:goaly/ui/screens/goals/no_goals_placeholder.dart';
import 'package:provider/provider.dart';

class ExistingGoalsList extends StatelessWidget {
  const ExistingGoalsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalsStream =
        context.watch<GoalsService>().getCurrentUserGoalsSnapshots();

    return StreamBuilder(
      stream: goalsStream,
      builder: (context, AsyncSnapshot<List<Goal>> snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data!.isEmpty){
            return const NoGoalsPlaceholder();
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, int index) {
              return ExistingGoalCard(
                goal: snapshot.data![index],
                key: Key(snapshot.data![index].id),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 10),
          );
        } else if (snapshot.hasError) {
          return const Placeholder();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
