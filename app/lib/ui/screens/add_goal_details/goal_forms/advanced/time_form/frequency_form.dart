import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/time_form/per_day_time_form.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/time_form/same_time_everyday_form.dart';
import 'package:goaly/ui/widgets/infrastructure/switch_list_tile_with_no_ripple.dart';

class TimeForm extends StatefulWidget {
  const TimeForm({Key? key}) : super(key: key);

  @override
  State<TimeForm> createState() => _TimeFormState();
}

class _TimeFormState extends State<TimeForm> {
  var isSameHourEveryday = true;

  void _onSameHourEachDayTap() {
    setState(() {
      isSameHourEveryday = !isSameHourEveryday;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTileWithNoRipple(
          value: isSameHourEveryday,
          label: const Text(
            "Configure hours for each day separately",
            style: TextStyle(fontSize: 20),
          ),
          onTap: _onSameHourEachDayTap,
        ),
        const SizedBox(
          height: 20,
        ),
        isSameHourEveryday
            ? const PerDayTimeForm()
            : const SameTimeEverydayForm(),
      ],
    );
  }
}
