import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationService {
  static final _googleSignIn = GoogleSignIn();

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

  bool isLoggedIn () {
    return FirebaseAuth.instance.currentUser != null;
  }
}

final authenticationServiceProvider = Provider<AuthenticationService>((ref) {

  return AuthenticationService();
});
