import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:provider/provider.dart';

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
