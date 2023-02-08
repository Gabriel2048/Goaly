import 'dart:async';
import 'package:goaly/services/authentication/google_authentication_service.dart';
import 'package:googleapis/calendar/v3.dart';

class CalendarService {
  final GoogleAuthenticationService _googleAuthService;

  CalendarService(this._googleAuthService);

  Future<String> _getUsersTimeZone() async {
    final calendar = await _runWithCalendarClient(
      (calendarClient) => calendarClient.calendars.get('primary'),
    );
    return calendar.timeZone!;
  }

  Future<void> addEvent(
    DateTime start,
    DateTime end,
    List<String>? recurrence,
  ) async {
    final timeZone = await _getUsersTimeZone();

    final eventToAdd = Event(
      summary: '[Goaly] My event',
      start: EventDateTime(
        dateTime: start,
        timeZone: timeZone,
      ),
      end: EventDateTime(
        dateTime: end,
        timeZone: timeZone,
      ),
      recurrence: recurrence,
    );

    await _runWithCalendarClient(
      (calendarClient) => calendarClient.events.insert(eventToAdd, 'primary'),
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
}
