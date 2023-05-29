import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            onPressed: () {},
            child: const Text("Add"),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
