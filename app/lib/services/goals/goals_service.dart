import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/calendar/calendar_service.dart';
import 'package:goaly/services/goals/add_goal_model.dart';
import 'package:goaly/services/goals/recurrence_builder.dart';
import 'package:goaly/services/goaly_collections.dart';

class GoalsService {
  final CalendarService _calendarService;

  GoalsService(this._calendarService);

  Future<void> addGoal(AddGoalModel goal) async {
    _calendarService.sortOccurrences(goal.occurrences);

    for (var occurrence in goal.occurrences) {
      final startDate = _calendarService.getNextWeekDay(
          occurrence.weekDay, occurrence.timeOfDay);
      final endDate = _calendarService
          .getNextWeekDay(occurrence.weekDay, occurrence.timeOfDay)
          .add(const Duration(days: 14));

      final recurrence = [
        RecurrenceBuilder.recurrenceForDay(occurrence.weekDay)
      ];

      final eventId = await _calendarService.addEvent(
        startDate,
        endDate,
        recurrence,
      );
      occurrence.googleCalendarEventId = eventId;
    }

    await GoalyCollections.goalsOfCurrentUser.add(goal.toMap());
  }

  Future<void> deleteGoal(Goal goal) async {
    for (var occurrence in goal.occurrences) {
      await _calendarService.deleteEvent(occurrence.googleCalendarEventId);
    }

    await GoalyCollections.goalsOfCurrentUser.doc(goal.id).delete();
  }

  Stream<List<Goal>> getCurrentUserGoalsSnapshots() {
    final goalsQuery = GoalyCollections.goalsOfCurrentUser;
    return goalsQuery.snapshots().map((snapshot) {
      return snapshot.docs.map((e) {
        return Goal.fromMap(e.data(), e.id);
      }).toList();
    });
  }
}
