import 'package:flutter/material.dart';
import 'package:goaly/domain/goal_time_of_day.dart';

class TimeOfDayDropdown extends StatelessWidget {
  const TimeOfDayDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<GoalTimeOfDay>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Time of day',
      ),
      items: const [
        DropdownMenuItem(
          value: GoalTimeOfDay.morning,
          child: Text('Morning'),
        ),
        DropdownMenuItem(
          value: GoalTimeOfDay.midday,
          child: Text('Midday'),
        ),
        DropdownMenuItem(
          value: GoalTimeOfDay.evening,
          child: Text('Evening'),
        ),
        DropdownMenuItem(
          value: GoalTimeOfDay.anytime,
          child: Text('Anytime'),
        )
      ],
      onChanged: (GoalTimeOfDay? value) {},
    );
  }
}
