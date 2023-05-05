import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/day_picker.dart';
import 'package:goaly/ui/widgets/infrastructure/switch_list_tile_with_no_ripple.dart';
import 'package:goaly/ui/widgets/infrastructure/time_list_tile.dart';

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

  void _onTimeChanged(TimeOfDay newTime) async {
    setState(() {
      _time = newTime;
    });
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
          label: const Text(
            "Same hour each day",
            style: TextStyle(fontSize: 20),
          ),
          onTap: _onSameHourEachDayTap,
        ),
        TimeListTile(
          time: _time,
          label: const Text(
            "Time of day",
            style: TextStyle(fontSize: 20),
          ),
          trailing: Align(
            alignment: Alignment.centerRight,
            child: Text(
              _time.format(context),
              style: const TextStyle(fontSize: 50),
            ),
          ),
          onTimeChanged: _onTimeChanged,
        ),
      ],
    );
  }
}
