import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoGoalsPlaceholder extends StatelessWidget {
  const NoGoalsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage('assets/goals/empty.png'),
          color: Theme.of(context).textTheme.headlineSmall!.color,
        ),
        const SizedBox(height: 50),
        Text(
          'No goals yet. Get ambitious and add one using the button below!',
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
