import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/widgets/infrastructure/time_list_tile.dart';
import 'package:provider/provider.dart';

class SameTimeEverydayForm extends StatelessWidget {
  const SameTimeEverydayForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forProvider = context.watch<GoalFormProvider>();
    final displayTime = forProvider.selectedDaysTime.entries.isNotEmpty
        ? forProvider.selectedDaysTime.entries.first.value
        : forProvider.defaultTime;
    return TimeListTile(
      pickerInitialTime: forProvider.defaultTime,
      label: const Text(
        "Time of day",
        style: TextStyle(fontSize: 20),
      ),
      trailing: Align(
        alignment: Alignment.centerRight,
        child: Text(
          displayTime.format(context),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      onTimeChanged: (TimeOfDay newTime) {
        forProvider.setTime(newTime, null);
      },
    );
  }
}
