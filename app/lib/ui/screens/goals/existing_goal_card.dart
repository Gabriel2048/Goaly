import 'package:flutter/material.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ExistingGoalCard extends StatelessWidget {
  final Goal goal;

  const ExistingGoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      height: 100,
      width: 100,
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            goal.title,
            style: GoogleFonts.chewy(
              textStyle: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Row(
            children: [
              Text(
                goal.goalTimeOfDay.name,
                style: GoogleFonts.chewy(
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
