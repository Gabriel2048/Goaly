import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/day_picker.dart';

class AddGoalDetailsAdvancedForm extends StatefulWidget {
  const AddGoalDetailsAdvancedForm({Key? key}) : super(key: key);

  @override
  State<AddGoalDetailsAdvancedForm> createState() =>
      _AddGoalDetailsAdvancedFormState();
}

class _AddGoalDetailsAdvancedFormState
    extends State<AddGoalDetailsAdvancedForm> {
  var isSameHourEachDay = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      // runAlignment: WrapAlignment.spaceEvenly,
      // direction: Axis.vertical,
      children: [
        const DayPicker(),
        const SizedBox(
          height: 20,
        ),
        SwitchListTile(
          value: isSameHourEachDay,
          onChanged: (value) {
            setState(() {
              isSameHourEachDay = !isSameHourEachDay;
            });
          },
          title: const Text("Same hour each day"),
          contentPadding: const EdgeInsets.only(left: 5),
        )
      ],
    );
  }
}
