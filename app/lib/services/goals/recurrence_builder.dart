import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';

class RecurrenceBuilder {
  static List<String> buildRecurrence(
      GoalFrequency frequency, GoalTimeOfDay timeOfDay) {
    final freq = _buildFrequency(frequency);
    final byHour = _buildByHour(timeOfDay);

    return ['RRULE:$freq${byHour != null ? ';' : ''}$byHour'];
  }

  static String _buildFrequency(GoalFrequency frequency) {
    switch (frequency) {
      case GoalFrequency.daily:
        return 'FREQ=DAILY';
      case GoalFrequency.threeTimesPerWeek:
        return 'FREQ=WEEKLY;INTERVAL=1;BYDAY=MO,WE,FR';
      case GoalFrequency.twicePerWeek:
        return 'FREQ=WEEKLY;INTERVAL=1;BYDAY=TU,TH';
      case GoalFrequency.weekly:
        return 'FREQ=WEEKLY;INTERVAL=1;BYDAY=WE';
      case GoalFrequency.monthly:
        return 'FREQ=MONTHLY;INTERVAL=1;BYDAY=MO,WE,FR';
    }
  }

  static String? _buildByHour(GoalTimeOfDay timeOfDay) {
    switch (timeOfDay) {
      case GoalTimeOfDay.morning:
        return 'BYHOUR=8';
      case GoalTimeOfDay.midday:
        return 'BYHOUR=12';
      case GoalTimeOfDay.evening:
        return 'BYHOUR=18';
      case GoalTimeOfDay.anytime:
        return null;
    }
  }
}
