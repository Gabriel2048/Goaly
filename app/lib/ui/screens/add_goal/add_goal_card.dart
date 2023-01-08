import 'package:flutter/material.dart';
import 'package:goaly/providers/addable_goals_provider.dart';
import 'package:goaly/ui/screens/new_goal/new_goal_screen.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalCard extends StatelessWidget {
  final AddableGoal addableGoal;
  const AddGoalCard({Key? key, required this.addableGoal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final height = deviceSize.height * 0.13;

    return TappableCard(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              addableGoal.assetPath,
              height: height / 1.5,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  addableGoal.description,
                  style: GoogleFonts.chewy(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, NewGoalScreen.route);
      },
    );
  }
}
