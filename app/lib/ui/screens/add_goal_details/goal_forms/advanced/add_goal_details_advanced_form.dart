import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/day_picker.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/time_form/frequency_form.dart';

class AddGoalDetailsAdvancedForm extends StatelessWidget {
  const AddGoalDetailsAdvancedForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DayPicker(),
        SizedBox(
          height: 20,
        ),
        TimeForm(),
      ],
    );
  }
}
