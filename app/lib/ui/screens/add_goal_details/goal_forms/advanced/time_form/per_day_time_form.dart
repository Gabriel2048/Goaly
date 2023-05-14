import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/extensions/string/string_extensions.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/selected_week_days/selected_week_days_notifier.dart';
import 'package:goaly/ui/widgets/infrastructure/time_list_tile.dart';
import 'package:provider/provider.dart';

class PerDayTimeForm extends StatelessWidget {
  const PerDayTimeForm({Key? key}) : super(key: key);

  int _sortByDayIndex(WeekDays left, WeekDays right) {
    return left.index.compareTo(right.index);
  }

  @override
  Widget build(BuildContext context) {
    var selectedWeekDays =
        context.watch<SelectedWeekDaysProvider>().selectedDays;
    selectedWeekDays.sort(_sortByDayIndex);

    return Column(
      children: selectedWeekDays.map((e) {
        return TimeListTile(
          key: ValueKey(e),
          time: TimeOfDay.now(),
          label: Text(
            e.name.capitalize(),
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Align(
            alignment: Alignment.centerRight,
            child: Text(
              TimeOfDay.now().format(context),
              style: const TextStyle(fontSize: 50),
            ),
          ),
        );
      }).toList(),
    );
  }
}
