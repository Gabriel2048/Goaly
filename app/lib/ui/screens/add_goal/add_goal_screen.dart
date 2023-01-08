import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal/add_goal_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalScreen extends StatelessWidget {
  static const String route = "AddGoalScreen";

  const AddGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'I want to ...',
              style: GoogleFonts.chewy(
                textStyle: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, __) => const AddGoalCard(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
                itemCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
