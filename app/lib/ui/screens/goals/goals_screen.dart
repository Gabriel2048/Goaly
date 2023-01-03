import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/providers/goals_provider.dart';
import 'package:goaly/ui/screens/new_goal/new_goal_screen.dart';
import 'package:goaly/ui/widgets/app_drawer.dart';

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
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final goalsStream = ref.watch(goalsProvider.stream);
          return StreamBuilder(
            stream: goalsStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Goal>> snapshot) {
              if (snapshot.hasData && snapshot.error == null) {
                return Text(snapshot.data![0].title);
              }
              return const CircularProgressIndicator();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add Goal'),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, NewGoalScreen.route);
        },
      ),
    );
  }
}
