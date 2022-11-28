import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoalsService {
  final FirebaseFunctions functions = FirebaseFunctions.instance;
  final defaultOptions = HttpsCallableOptions(timeout: const Duration(seconds: 3));

  Future<HttpsCallableResult<dynamic>> _callWithDefaultTimeout(Functions function) {
    return functions.httpsCallable(function.name, options: defaultOptions).call();
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
