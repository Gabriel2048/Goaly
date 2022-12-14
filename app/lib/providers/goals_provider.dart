import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/goals_service.dart';

final goalsProvider = StreamProvider<List<Goal>>((ref) async* {
  final goalsService = ref.watch(goalsServiceProvider);

  await for (var snapshot in goalsService.getCurrentUserGoalsSnapshots()) {
    yield snapshot.docs.map((e) => Goal.fromMap(e.data())).toList();
  }
});
