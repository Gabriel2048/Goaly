import 'dart:async';
import 'package:goaly/services/authentication/google_authentication_service.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart' as http;

class CalendarService {
  final GoogleAuthenticationService _googleAuthService;

  CalendarService(this._googleAuthService);

  Future<void> test() async {
    final userAuth = await _googleAuthService.getAuthentication();

    final AccessCredentials credentials = AccessCredentials(
      AccessToken(
        'Bearer',
        userAuth.accessToken!,
        DateTime.now().toUtc().add(const Duration(hours: 1)),
      ),
      null,
      calendarScopes,
    );
    final calendarClient = authenticatedClient(http.Client(), credentials);

    var calendar = CalendarApi(calendarClient);
    final events = await calendar.events.list('primary');
  }
}
