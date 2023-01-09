import 'package:flutter/material.dart';
import 'package:goaly/domain/goal_time_of_day.dart';

class TimeOfDayDropdown extends StatelessWidget {
  final Function(GoalTimeOfDay? value)? onSaved;

  const TimeOfDayDropdown({Key? key, this.onSaved}) : super(key: key);

  String? _requiredValidator(GoalTimeOfDay? value) {
    return value == null ? 'Time of day is required.' : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<GoalTimeOfDay>(
      validator: _requiredValidator,
      onSaved: onSaved,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Time of day (required)',
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
