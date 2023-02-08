import 'dart:async';
import 'package:goaly/services/authentication/google_authentication_service.dart';
import 'package:googleapis/calendar/v3.dart';

class CalendarService {
  final GoogleAuthenticationService _googleAuthService;

  CalendarService(this._googleAuthService);

  Future<void> test() async {
    final events = await _runWithCalendarClient((calendarClient) async {
      return await calendarClient.events.list('primary');
    });
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
