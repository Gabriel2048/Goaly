import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/new_goal/new_goal_screen.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';

class NewGoal extends StatelessWidget {
  const NewGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      height: 100,
      width: 100,
      onTap: () {
        Navigator.pushNamed(context, NewGoalScreen.route);
      },
      child: const Icon(Icons.add),
    );
  }
}
