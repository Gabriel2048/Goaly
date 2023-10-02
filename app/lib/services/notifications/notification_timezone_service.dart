import 'package:goaly/services/calendar/calendar_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class TimezoneService {
  final CalendarService _calendarService;

  TimezoneService(this._calendarService);

  Future<void> initTimezoneData() async {
    tz.initializeTimeZones();
    final timeZoneName = await _calendarService.getUsersTimeZone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  static tz.TZDateTime getNextForDateTime(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.local);
  }
}
