import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart' as http;

const calendarScopes = [
  "https://www.googleapis.com/auth/calendar.events",
  'https://www.googleapis.com/auth/calendar.readonly'
];

class GoogleAuthenticationService {
  static final _googleSignIn = GoogleSignIn(scopes: calendarScopes);

  Future<OAuthCredential?> startGoogleAuth() async {
    final selectedGoogleAccount = await _googleSignIn.signIn();
    if (selectedGoogleAccount != null) {
      final authenticationResult = await selectedGoogleAccount.authentication;
      return GoogleAuthProvider.credential(
          accessToken: authenticationResult.accessToken,
          idToken: authenticationResult.idToken);
    }
    return null;
  }

  Future<void> logOut() async {
    await _googleSignIn.signOut();
  }

  Future<bool> get isLoggedIn => _googleSignIn.isSignedIn();

  Future<GoogleSignInAuthentication> getAuthentication(
      {bool silentSignIn = true}) async {
    if (silentSignIn) {
      await _silentSignInIfNeeded();
    }
    return currentUser.authentication;
  }

  GoogleSignInAccount get currentUser {
    return _googleSignIn.currentUser ??
        (throw Exception(
            "Attempted to use currentUser while no user logged in. Use this getter in conjunction with isLoggedIn."));
  }

  Future<void> _silentSignInIfNeeded() {
    if (_googleSignIn.currentUser == null) {
      return _googleSignIn.signInSilently();
    }
    return Future.value();
  }

  Future<AuthClient> createAuthenticatedClient() async {
    final userAuth = await getAuthentication();

    final AccessCredentials credentials = AccessCredentials(
      AccessToken(
        'Bearer',
        userAuth.accessToken!,
        DateTime.now().toUtc().add(const Duration(hours: 1)),
      ),
      null,
      calendarScopes,
    );

    return authenticatedClient(http.Client(), credentials);
  }
}

final googleAuthenticationServiceProvider =
    Provider<GoogleAuthenticationService>((ref) {
  return GoogleAuthenticationService();
});
