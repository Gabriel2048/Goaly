import 'package:goaly/core/week_days.dart';

class RecurrenceBuilder {

  static String recurrenceForDay(WeekDays weekDay){
    return 'RRULE:FREQ=WEEKLY;INTERVAL=1;BYDAY=${_weekDayToString(weekDay)}';
  }

  static String _weekDayToString(WeekDays weekDay){
    switch (weekDay) {
      case WeekDays.monday:
        return 'MO';
      case WeekDays.tuesday:
        return 'TU';
      case WeekDays.wednesday:
        return 'WE';
      case WeekDays.thursday:
        return 'TH';
      case WeekDays.friday:
        return 'FR';
      case WeekDays.saturday:
        return 'SA';
      case WeekDays.sunday:
        return 'SU';
    }
  }
}
