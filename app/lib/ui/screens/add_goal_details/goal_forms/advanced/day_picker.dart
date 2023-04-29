import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/selected_week_days_notifier.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/selected_week_days_provider.dart';

class DayPicker extends StatelessWidget {
  const DayPicker({
    Key? key,
  }) : super(key: key);

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

class DayButton extends ConsumerWidget {
  final WeekDays weekDay;

  const DayButton({
    Key? key,
    required this.weekDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(selectedWeekDaysProvider).contains(weekDay);

    return OutlinedButton(
      onPressed: () =>
          ref.read(selectedWeekDaysProvider.notifier).toggleDay(weekDay),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).buttonTheme.colorScheme?.secondaryContainer
            : null,
        padding: EdgeInsets.zero,
      ),
      child: Center(child: Text(weekDay.name[0].toUpperCase())),
    );
  }
}
