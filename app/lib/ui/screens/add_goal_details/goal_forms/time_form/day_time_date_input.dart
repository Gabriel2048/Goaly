import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/extensions/string/string_extensions.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/widgets/infrastructure/time_list_tile.dart';
import 'package:provider/provider.dart';

class DayTimeDateInput extends StatelessWidget {
  const DayTimeDateInput({Key? key}) : super(key: key);

  int _sortByDayIndex(WeekDays left, WeekDays right) {
    return left.index.compareTo(right.index);
  }

  @override
  Widget build(BuildContext context) {
    final goalFormProvider = context.watch<GoalFormProvider>();
    var selectedDaysTime = goalFormProvider.selectedDaysTime;
    final selectedWeekDays = goalFormProvider.selectedDays
      ..sort(_sortByDayIndex);

    return Column(
      children: selectedWeekDays.map((day) {
        return TimeListTile(
          key: ValueKey(day),
          onTimeChanged: (newTime) {
            goalFormProvider.setTimeForDay(day, newTime);
          },
          pickerInitialTime: goalFormProvider.defaultTime,
          label: Text(
            day.name.capitalize(),
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Align(
            alignment: Alignment.centerRight,
            child: Text(
              selectedDaysTime[day]!.format(context),
              style: const TextStyle(fontSize: 50),
            ),
          ),
        );
      }).toList(),
    );
  }
}
