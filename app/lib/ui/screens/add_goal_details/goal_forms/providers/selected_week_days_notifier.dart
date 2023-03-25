import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WeekDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

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
