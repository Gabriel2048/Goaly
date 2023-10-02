import 'package:goaly/services/authentication/authentication_service.dart';
import 'package:goaly/services/authentication/google_authentication_service.dart';
import 'package:goaly/services/calendar/calendar_service.dart';
import 'package:goaly/services/goals/goals_service.dart';
import 'package:goaly/services/notifications/notification_timezone_service.dart';
import 'package:provider/provider.dart';

final servicesProviders = [
  Provider<GoogleAuthenticationService>(
    create: (_) => GoogleAuthenticationService(),
  ),
  Provider<AuthenticationService>(
    create: (context) {
      return AuthenticationService(
          Provider.of<GoogleAuthenticationService>(context, listen: false));
    },
  ),
  Provider<CalendarService>(
    create: (context) {
      return CalendarService(
          Provider.of<GoogleAuthenticationService>(context, listen: false));
    },
  ),
  Provider<GoalsService>(
    create: (context) {
      return GoalsService(Provider.of<CalendarService>(context, listen: false));
    },
  ),
  Provider<TimezoneService>(
    create: (context) {
      return TimezoneService(
          Provider.of<CalendarService>(context, listen: false));
    },
  ),
];
