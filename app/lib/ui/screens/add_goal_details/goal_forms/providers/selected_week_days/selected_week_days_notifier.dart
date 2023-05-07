import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/core/week_days.dart';

class SelectedWeekDaysNotifier extends StateNotifier<List<WeekDays>> {
  SelectedWeekDaysNotifier() : super([]);

  void toggleDay(WeekDays day) {
    final newState = [...state];

    if (state.contains(day)) {
      newState.remove(day);
    } else {
      newState.add(day);
    }

    state = newState;
  }
}
