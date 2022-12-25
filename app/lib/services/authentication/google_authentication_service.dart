import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const scopes = [
  "https://www.googleapis.com/auth/calendar.events",
];

class GoogleAuthenticationService {
  static final _googleSignIn = GoogleSignIn(scopes: scopes);

  Future<OAuthCredential?> startGoogleAuth() async {
    final selectedGoogleAccount = await _googleSignIn.signIn();
    if (selectedGoogleAccount != null) {
      final authenticationResult = await selectedGoogleAccount.authentication;
      return GoogleAuthProvider.credential(
          accessToken: authenticationResult.accessToken, idToken: authenticationResult.idToken);
    }
    return null;
  }

  Future<void> logOut() async {
    await _googleSignIn.disconnect();
  }

  Future<bool> get isLoggedIn => _googleSignIn.isSignedIn();

  GoogleSignInAccount get currentUser => _googleSignIn.currentUser
      ?? (throw Exception("Attempted to use currentUser while no user logged in. Use this getter in conjunction with isLoggedIn."));

  Future<void> disconnect() {
    return _googleSignIn.disconnect();
  }
}

final googleAuthenticationServiceProvider = Provider<GoogleAuthenticationService>((ref) {
  return GoogleAuthenticationService();
});
