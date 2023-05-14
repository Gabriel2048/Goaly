import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/calendar/calendar_service.dart';
import 'package:goaly/services/goals/add_goal_model.dart';
import 'package:goaly/services/goaly_gollections.dart';

class GoalsService {
  final CalendarService _calendarService;

  GoalsService(this._calendarService);

  Future<void> addGoal(AddGoalModel goal) async {
    // final recurrence = RecurrenceBuilder.buildRecurrence(
    //   goal.frequency,
    //   goal.timeOfDay,
    // );

    await _calendarService.addEvent(
        DateTime.now(),
        DateTime.now().add(
          const Duration(hours: 1),
        ),
        []);

    await GoalyCollections.goalsOfCurrentUser.add(goal.toMap());
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
