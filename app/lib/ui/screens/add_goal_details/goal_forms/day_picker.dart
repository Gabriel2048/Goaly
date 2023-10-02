import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
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

  const DayButton({Key? key, required this.weekDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalFormProvider = context.watch<GoalFormProvider>();
    final selectedDays = goalFormProvider.selectedDays;
    final selectedGoalColor =
        Theme.of(context).buttonTheme.colorScheme?.secondaryContainer;

    return OutlinedButton(
      onPressed: () {
        final isDeselectingSingleDay =
            selectedDays.length == 1 && selectedDays.contains(weekDay);
        if (isDeselectingSingleDay) {
          return;
        }
        goalFormProvider.toggleDay(weekDay);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            goalFormProvider.containsDay(weekDay) ? selectedGoalColor : null,
        padding: EdgeInsets.zero,
      ),
      child: Center(child: Text(weekDay.name[0].toUpperCase())),
    );
  }
}
