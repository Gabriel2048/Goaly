import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/new_goal/new_goal_form.dart';

class NewGoalScreen extends StatelessWidget {
  const NewGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new goal"),
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 35, right: 35, top: 35),
        child: NewGoalForm(),
      ),
    );
  }
}
