import 'package:flutter/material.dart';
import 'package:goaly/domain/goal_type.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/add_goal_details_form.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalDetailsScreen extends StatelessWidget {
  final GoalDescription goalDescription;

  const AddGoalDetailsScreen({Key? key, required this.goalDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configure your goal",
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Hero(
            tag: goalDescription.description,
            child: Text(
              goalDescription.description,
              style: GoogleFonts.chewy(
                textStyle: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
            child: AddGoalDetailsForm(
              isTitleConfigurable: goalDescription.goalType == GoalType.custom,
            ),
          ),
        ],
      ),
    );
  }
}
