import 'package:flutter/material.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/add_goal_details_screen.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
      child: Hero(
        tag: goalDescription.goalType,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(goalDescription.assetPath),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    goalDescription.description,
                    style: GoogleFonts.chewy(
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Provider.of<GoalFormProvider>(context, listen: false)
            .setGoalType(goalDescription.goalType);
        Navigator.push(
            context,
            PageRouteBuilder(
              settings:
                  const RouteSettings(name: AddGoalDetailsScreen.routeName),
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, animation, ___) =>
                  AddGoalDetailsScreen(goalDescription: goalDescription),
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child,
                );
              },
            ));
      },
    );
  }
}
