import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/time_form/day_picker/day_button.dart';

class DayPicker extends StatelessWidget {
  const DayPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (var weekDay in WeekDays.values)
          SizedBox(
            key: Key(weekDay.toString()),
            width: 40,
            height: 40,
            child: DayButton(
              weekDay: weekDay,
            ),
          )
      ],
    );
  }
}
