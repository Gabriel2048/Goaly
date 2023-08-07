import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/domain/goal_type.dart';
import 'package:goaly/extensions/goal_type/goal_type_extensions.dart';

class Goal {
  final String id;
  final GoalType goalType;
  final String? _title;

  String get title => _title ?? goalType.toReadable();

  final List<GoalOccurrence> occurrences;

  const Goal({
    required this.id,
    required String? title,
    required this.goalType,
    this.occurrences = const [],
  }) : _title = title;

  factory Goal.fromMap(
    Map<String, dynamic> properties,
    String id,
  ) {
    final occurrences = (properties['occurrences'] as List<dynamic>)
        .map((occurrence) => GoalOccurrence.fromMap(occurrence))
        .toList();
    return Goal(
      id: id,
      title: properties['title'],
      goalType: GoalType.values.byName(properties['goalType']),
      occurrences: occurrences,
    );
  }
}

class GoalOccurrence {
  final WeekDays weekDay;
  final TimeOfDay timeOfDay;
  late String googleCalendarEventId;

  GoalOccurrence({
    required this.weekDay,
    required this.timeOfDay,
    this.googleCalendarEventId = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'weekDay': weekDay.name,
      // Store only the enum value
      'timeOfDay': timeOfDay.hour * 60 + timeOfDay.minute,
      // Store as minutes since midnight
      'googleCalendarEventId': googleCalendarEventId,
    };
  }

  static GoalOccurrence fromMap(Map<String, dynamic> map) {
    return GoalOccurrence(
      weekDay: WeekDays.values
          .firstWhere((day) => day.toString().split('.')[1] == map['weekDay']),
      timeOfDay: TimeOfDay(
          hour: map['timeOfDay'] ~/ 60, minute: map['timeOfDay'] % 60),
      googleCalendarEventId: map['googleCalendarEventId'],
    );
  }
}
