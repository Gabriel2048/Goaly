import 'dart:async';
import 'package:goaly/core/week_days.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/authentication/google_authentication_service.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:flutter/material.dart';

class CalendarService {
  final GoogleAuthenticationService _googleAuthService;

  CalendarService(this._googleAuthService);

  Future<String> _getUsersTimeZone() async {
    final calendar = await _runWithCalendarClient(
      (calendarClient) => calendarClient.calendars.get('primary'),
    );
    return calendar.timeZone!;
  }

  Future<String> addEvent(
    DateTime start,
    DateTime end,
    String title,
    List<String> recurrence,
  ) async {
    final timeZone = await _getUsersTimeZone();

    final eventToAdd = Event(
      summary: '[Goaly] $title',
      start: EventDateTime(
        dateTime: start,
        timeZone: timeZone,
      ),
      end: EventDateTime(
        dateTime: start.add(const Duration(hours: 1)),
        timeZone: timeZone,
      ),
      recurrence: recurrence,
    );

    final event = await _runWithCalendarClient(
      (calendarClient) => calendarClient.events.insert(eventToAdd, 'primary'),
    );

    return event.id!;
  }

  Future<void> deleteEvent(String eventId) async {
    await _runWithCalendarClient(
      (calendarClient) => calendarClient.events.delete('primary', eventId),
    );
  }

  /// Utility method for ensuring the AuthClient.close() is called.
  Future<T> _runWithCalendarClient<T>(
      Future<T> Function(CalendarApi) func) async {
    final client = await _googleAuthService.createAuthenticatedClient();

    try {
      return await func(CalendarApi(client));
    } finally {
      client.close();
    }
  }

  DateTime getNextWeekDay(WeekDays day, TimeOfDay? withTimeOfDay) {
    var now = DateTime.now();
    int currentWeekday = now.weekday;
    int targetWeekday = day.index + 1;

    if (targetWeekday <= currentWeekday) {
      targetWeekday += 7;
    }

    int daysUntilNextDay = targetWeekday - currentWeekday;

    DateTime nextOccurrence = now.add(Duration(days: daysUntilNextDay));
    if (withTimeOfDay != null) {
      nextOccurrence = DateTime(
        nextOccurrence.year,
        nextOccurrence.month,
        nextOccurrence.day,
        withTimeOfDay.hour,
        withTimeOfDay.minute,
      );
    }

    return nextOccurrence;
  }

  void sortOccurrences(List<GoalOccurrence> occurrences) {
    occurrences.sort((a, b) => a.weekDay.index.compareTo(b.weekDay.index));
  }
}
