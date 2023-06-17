import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddGoalDetailsScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AddGoalDetailsScreenAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Configure your goal",
        style: GoogleFonts.chewy(
          textStyle: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: FilledButton(
            onPressed:
                Provider.of<GoalFormProvider>(context, listen: false).addGoal,
            child: const Text("Add"),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
