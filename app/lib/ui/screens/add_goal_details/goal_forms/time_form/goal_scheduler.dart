import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/time_form/day_time_date_input.dart';
import 'package:provider/provider.dart';

class GoalScheduler extends StatefulWidget {
  const GoalScheduler({Key? key}) : super(key: key);

  @override
  State<GoalScheduler> createState() => _GoalSchedulerState();
}

class _GoalSchedulerState extends State<GoalScheduler> {
  @override
  Widget build(BuildContext context) {
    final goalFormProvider = context.watch<GoalFormProvider>();
    final selectedDays = goalFormProvider.selectedDays;
    final multipleDaysSelected = selectedDays.length > 1;

    return AnimatedOpacity(
      opacity: selectedDays.isNotEmpty ? 1 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          if (selectedDays.isNotEmpty) const Divider(),
          const DayTimeDateInput(),
          if (selectedDays.isNotEmpty) const Divider(),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: multipleDaysSelected
                  ? () async {
                      final t = await showTimePicker(
                          context: context,
                          initialTime: goalFormProvider.defaultTime);
                      if (t != null) {
                        goalFormProvider.setTimeForAllDays(t);
                      }
                    }
                  : null,
              child: const Text(
                "Set time for all days",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
