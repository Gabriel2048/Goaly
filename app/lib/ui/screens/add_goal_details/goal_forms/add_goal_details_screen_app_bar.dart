import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/screens/goals/goals_screen.dart';
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
          child: Consumer<GoalFormProvider>(
            builder: (_, goalFormProvider, __) {
              return FilledButton(
                onPressed: !goalFormProvider.canAdd
                    ? null
                    : () async {
                        final navigator = Navigator.of(context);
                        await goalFormProvider.addGoal();
                        navigator.popUntil(
                            ModalRoute.withName(GoalsScreen.routeName));
                      },
                child: goalFormProvider.isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Text("Add"),
              );
            },
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
