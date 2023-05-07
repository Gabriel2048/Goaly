import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/selected_week_days/selected_week_days_notifier.dart';

final selectedWeekDaysProvider =
    StateNotifierProvider<SelectedWeekDaysNotifier, List<WeekDays>>((ref) {
  return SelectedWeekDaysNotifier();
});
