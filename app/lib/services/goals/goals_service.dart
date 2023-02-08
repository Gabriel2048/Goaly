import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/calendar/calendar_service.dart';
import 'package:goaly/services/goals/recurrence_builder.dart';
import 'package:goaly/services/goaly_gollections.dart';
import 'package:goaly/services/authentication/google_authentication_service.dart';

class GoalsService {
  final CalendarService _calendarService;

  GoalsService(this._calendarService);

  Future<void> addGoal(Goal goal) async {
    final recurrence = RecurrenceBuilder.buildRecurrence(
      goal.frequency,
      goal.timeOfDay,
    );

    await _calendarService.addEvent(
        DateTime.now(),
        DateTime.now().add(
          const Duration(hours: 1),
        ),
        recurrence);

    await GoalyCollections.goalsOfCurrentUser.add(goal.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCurrentUserGoalsSnapshots() {
    final goalsQuery = GoalyCollections.goalsOfCurrentUser;
    return goalsQuery.snapshots();
  }
}

final goalsServiceProvider = Provider<GoalsService>((ref) {
  final googleAuthService = ref.watch(googleAuthenticationServiceProvider);

  return GoalsService(CalendarService(googleAuthService));
});
