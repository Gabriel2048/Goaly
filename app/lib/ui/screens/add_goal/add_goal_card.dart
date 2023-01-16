import 'package:flutter/material.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/add_goal_details_screen.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalCard extends StatelessWidget {
  final GoalDescription goalDescription;

  const AddGoalCard({Key? key, required this.goalDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final height = deviceSize.height * 0.13;

    return TappableCard(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(goalDescription.assetPath),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: goalDescription.description,
                  child: Text(
                    goalDescription.description,
                    style: GoogleFonts.chewy(
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                AddGoalDetailsScreen(goalDescription: goalDescription),
          ),
        );
      },
    );
  }
}
