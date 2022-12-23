import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';

class GoalsService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final _defaultOptions = HttpsCallableOptions(timeout: const Duration(seconds: 16));

  Future<HttpsCallableResult<dynamic>> _callWithDefaultTimeout(Functions function,
      {dynamic arguments}) {
    return _functions.httpsCallable(function.name, options: _defaultOptions).call(arguments);
  }

  Future<HttpsCallableResult<dynamic>> addGoal(Goal goal) {
    return _callWithDefaultTimeout(Functions.addGoal, arguments: goal.toMap());
  }
}

enum Functions {
  addGoal;
}

final goalsServiceProvider = Provider<GoalsService>((ref) {
  return GoalsService();
});
