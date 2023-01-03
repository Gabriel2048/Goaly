import 'package:flutter/material.dart';
import 'package:goaly/ui/widgets/app_drawer.dart';
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
      drawer: const AppDrawer(),
      body: const Center(
        child: NewGoal(),
      ),
    );
  }
}
