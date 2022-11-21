import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goaly/services/auth.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goaly'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FirebaseAuth.instance.currentUser != null
                ? Text(FirebaseAuth.instance.currentUser!.email!)
                : const Text("no user"),
            ElevatedButton.icon(
              onPressed: () async {
                await AuthService().logOut();
              },
              icon: const Icon(Icons.logout),
              label: const Text("log out"),
            )
          ],
        ),
      ),
    );
  }
}
