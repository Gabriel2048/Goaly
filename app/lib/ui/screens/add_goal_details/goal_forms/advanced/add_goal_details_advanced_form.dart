import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/day_picker.dart';
import 'package:goaly/ui/widgets/infrastructure/switch_list_tile_with_no_ripple.dart';

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
      children: [
        const DayPicker(),
        const SizedBox(
          height: 20,
        ),
        SwitchListTileWithNoRipple(
          value: isSameHourEachDay,
          label: const Text("Same hour each day"),
          onTap: () {
            setState(() {
              isSameHourEachDay = !isSameHourEachDay;
            });
          },
        ),
      ],
    );
  }
}
