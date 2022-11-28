import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalsService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final _defaultOptions = HttpsCallableOptions(timeout: const Duration(seconds: 3));

  Future<HttpsCallableResult<dynamic>> _callWithDefaultTimeout(Functions function) {
    return _functions.httpsCallable(function.name, options: _defaultOptions).call();
  }

  void addGoal() async {
    final result = await _callWithDefaultTimeout(Functions.addGoal);
  }
}

enum Functions {
  addGoal;
}

final goalsServiceProvider = Provider<GoalsService>((ref) {
  return GoalsService();
});
