import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/time_form/per_day_time_form.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/time_form/same_time_everyday_form.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/widgets/infrastructure/switch_list_tile_with_no_ripple.dart';
import 'package:provider/provider.dart';

class TimeForm extends StatefulWidget {
  const TimeForm({Key? key}) : super(key: key);

  @override
  State<TimeForm> createState() => _TimeFormState();
}

class _TimeFormState extends State<TimeForm> {
  var isConfiguringHoursEachDay = false;

  void _onSameHourEachDayTap() {
    setState(() {
      isConfiguringHoursEachDay = !isConfiguringHoursEachDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedDays = context.watch<GoalFormProvider>().selectedDays;
    return AnimatedOpacity(
      opacity: selectedDays.isNotEmpty ? 1 : 0.0,
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 150),
            crossFadeState: isConfiguringHoursEachDay
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: const PerDayTimeForm(),
            secondChild: const SameTimeEverydayForm(),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedOpacity(
            opacity: selectedDays.length > 1 ? 1 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: SwitchListTileWithNoRipple(
              value: isConfiguringHoursEachDay,
              label: const Text(
                "Configure hours for each day separately",
                style: TextStyle(fontSize: 20),
              ),
              onTap: _onSameHourEachDayTap,
            ),
          ),
        ],
      ),
    );
  }
}
