import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/services/authentication/google_authentication_service.dart';

class AuthenticationService {
  final GoogleAuthenticationService _googleAuthenticationService;

  AuthenticationService(this._googleAuthenticationService);

  Future<UserCredential?> startGoogleAuth() async {
    final selectedGoogleAccount = await _googleAuthenticationService.startGoogleAuth();
    if (selectedGoogleAccount != null) {
      return FirebaseAuth.instance.signInWithCredential(selectedGoogleAccount);
    }
    return null;
  }

  Future<void> logOut() async {
    await _googleAuthenticationService.logOut();
    await FirebaseAuth.instance.signOut();
  }

  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  User get currentUser => FirebaseAuth.instance.currentUser
      ?? (throw Exception("Attempted to use currentUser while no user logged in. Use this getter in conjunction with isLoggedIn."));
}

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  final googleAuthService = ref.watch(googleAuthenticationServiceProvider);
  return AuthenticationService(googleAuthService);
});
