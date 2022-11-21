import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';
import 'package:goaly/ui/screens/loggedin/logged_in_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return const LoggedInScreen();
        }
        return const AuthScreen();
      },
    );
  }
}
