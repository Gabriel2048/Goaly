import 'package:flutter/material.dart';
import 'package:goaly/ui/widgets/app_drawer.dart';
import 'package:goaly/ui/widgets/goals/new_goal.dart';

class GoalsScreen extends StatefulWidget {
  static const String route = "LoggedScreen";

  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
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
