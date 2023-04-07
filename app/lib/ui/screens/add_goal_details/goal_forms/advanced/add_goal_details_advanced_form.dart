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
  TimeOfDay _time = const TimeOfDay(hour: 12, minute: 0);

  void _onSameHourEachDayTap() {
    setState(() {
      isSameHourEachDay = !isSameHourEachDay;
    });
  }

  void _onTimeTap() async {
    final time = await showTimePicker(context: context, initialTime: _time);
    if (time != null) {
      setState(() {
        _time = time;
      });
    }
  }

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
          onTap: _onSameHourEachDayTap,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Select the time for the activity"),
            Expanded(
              child: GestureDetector(
                onTap: _onTimeTap,
                child: Center(
                  child: Text(
                    _time.format(context),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
