import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/services/authentication_service.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';
import 'package:goaly/ui/widgets/goals/new_goal.dart';

class LoggedInScreen extends StatefulWidget {
  static const String route = "LoggedScreen";

  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {

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
            const NewGoal(),
            Consumer(
              builder: (_, ref, __) => ElevatedButton.icon(
                onPressed: () async {
                  final authService = ref.watch(authenticationServiceProvider);
                  final navigator = Navigator.of(context);
                  await authService.logOut();
                  navigator.pushReplacementNamed(AuthScreen.route);
                },
                icon: const Icon(Icons.logout),
                label: const Text("log out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
