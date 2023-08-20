import 'package:flutter/material.dart';
import 'package:goaly/domain/goal.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalProgressScreen extends StatelessWidget {
  static const String routeName = "/goal-progress";

  const GoalProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goal = ModalRoute.of(context)!.settings.arguments as Goal;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Hero(
          tag: goal.id,
          child: Text(
            goal.title,
            style: GoogleFonts.chewy(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text("Goal Progress"),
      ),
    );
  }
}
