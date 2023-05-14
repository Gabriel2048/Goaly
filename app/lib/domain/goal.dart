import 'package:flutter/material.dart';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/domain/goal_type.dart';

class Goal {
  final String id;
  final GoalType goalType;
  final String? title;

  final List<Frequency> goalFrequency;

  const Goal({
    required this.id,
    required this.title,
    required this.goalType,
    this.goalFrequency = const [],
  });

  factory Goal.fromMap(
    Map<String, dynamic> properties,
    String id,
  ) {
    return Goal(
      id: id,
      title: properties['title'],
      goalType: GoalType.values.byName(properties['goalType']),
    );
  }

  Goal copyWith({
    String? id,
    GoalTimeOfDay? timeOfDay,
    GoalFrequency? frequency,
    String? title,
    GoalType? goalType,
    List<Frequency>? goalFrequency,
  }) {
    return Goal(
      id: id ?? this.id,
      title: title ?? this.title,
      goalType: goalType ?? this.goalType,
      goalFrequency: goalFrequency ?? this.goalFrequency,
    );
  }
}

class Frequency {
  final WeekDays weekDays;
  final TimeOfDay timeOfDay;

  const Frequency({
    required this.weekDays,
    required this.timeOfDay,
  });
}
