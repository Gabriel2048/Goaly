import 'package:flutter/material.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/add_goal_details_screen_app_bar.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/add_goal_details_advanced_form.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalDetailsScreen extends StatelessWidget {
  final GoalDescription goalDescription;

  const AddGoalDetailsScreen({
    Key? key,
    required this.goalDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddGoalDetailsScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Hero(
          tag: goalDescription.goalType,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  goalDescription.description,
                  style: GoogleFonts.chewy(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        child: AddGoalDetailsAdvancedForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
