import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const scopes = [
  "https://www.googleapis.com/auth/calendar",
  "https://www.googleapis.com/auth/calendar.events",
  "https://www.googleapis.com/auth/calendar.events.readonly",
  "https://www.googleapis.com/auth/calendar.readonly",
  "https://www.googleapis.com/auth/calendar.settings.readonly"
];

class AuthenticationService {
  static final _googleSignIn = GoogleSignIn(scopes: scopes);

  Future<UserCredential?> startGoogleAuth() async {
    final selectedGoogleAccount = await _googleSignIn.signIn();
    if (selectedGoogleAccount != null) {
      final authenticationResult = await selectedGoogleAccount.authentication;
      final cred = GoogleAuthProvider.credential(
          accessToken: authenticationResult.accessToken, idToken: authenticationResult.idToken);
      return await FirebaseAuth.instance.signInWithCredential(cred);
    }
    return null;
  }

  Future<void> logOut() async {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  bool get isLoggedIn => FirebaseAuth.instance.currentUser != null;

  User get currentUser => FirebaseAuth.instance.currentUser!;

  GoogleSignIn get q => _googleSignIn;
}

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService();
});
