import 'package:flutter/material.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/add_goal_details_form.dart';

class AddGoalDetailsScreen extends StatelessWidget {
  final GoalDescription goalDescription;

  const AddGoalDetailsScreen({Key? key, required this.goalDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new goal"),
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 35),
        child: AddGoalDetailsForm(),
      ),
    );
  }
}
