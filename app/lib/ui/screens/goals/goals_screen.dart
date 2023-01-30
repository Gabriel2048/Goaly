import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal/add_goal_screen.dart';
import 'package:goaly/ui/screens/goals/existing_goals_list.dart';
import 'package:goaly/ui/widgets/app_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Goaly',
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ExistingGoalsList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Add Goal',
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineSmall!,
          ),
        ),
        icon: const Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddGoalScreen()));
        },
      ),
    );
  }
}
