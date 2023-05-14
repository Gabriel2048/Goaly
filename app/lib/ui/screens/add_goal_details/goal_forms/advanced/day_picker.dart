import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/selected_week_days/selected_week_days_notifier.dart';
import 'package:provider/provider.dart';

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

class DayButton extends StatelessWidget {
  final WeekDays weekDay;

  const DayButton({
    Key? key,
    required this.weekDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedWeekDays = context.watch<SelectedWeekDaysProvider>();

    return OutlinedButton(
      onPressed: () => selectedWeekDays.toggleDay(weekDay),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedWeekDays.containsDay(weekDay)
            ? Theme.of(context).buttonTheme.colorScheme?.secondaryContainer
            : null,
        padding: EdgeInsets.zero,
      ),
      child: Center(child: Text(weekDay.name[0].toUpperCase())),
    );
  }
}
