import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/services/authentication/google_authentication_service.dart';

class GoalsService {
  final GoogleAuthenticationService _googleAuthenticationService;

  GoalsService(this._googleAuthenticationService);

  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final _defaultOptions = HttpsCallableOptions(timeout: const Duration(seconds: 16));

  Future<HttpsCallableResult<dynamic>> _callWithDefaultTimeout(Functions function,
      {dynamic arguments}) {
    return _functions.httpsCallable(function.name, options: _defaultOptions).call(arguments);
  }

  Future<HttpsCallableResult<dynamic>> addGoal(Goal goal) async {
    final authentication = await _googleAuthenticationService.getAuthentication();
    final arguments = {
      'googleAccessToken': authentication.accessToken,
      'goal': goal.toMap()
    };
    return _callWithDefaultTimeout(Functions.addGoal, arguments: arguments);
  }
}

enum Functions {
  addGoal;
}

final goalsServiceProvider = Provider<GoalsService>((ref) {
  final googleAuthService = ref.watch(googleAuthenticationServiceProvider);

  return GoalsService(googleAuthService);
});
