import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/frequency_dropdown.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ExistingGoalCard extends StatefulWidget {
  final Goal goal;

  const ExistingGoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  State<ExistingGoalCard> createState() => _ExistingGoalCardState();
}

class _ExistingGoalCardState extends State<ExistingGoalCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return TappableCard(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: isExpanded ? 200 : 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Consumer(
            builder: (_, WidgetRef ref, Widget? child) {
              final goalsDescriptions = ref.watch(goalDescriptionProvider);
              final goal = goalsDescriptions.singleWhere(
                  (element) => element.goalType == widget.goal.goalType);
              return Wrap(
                clipBehavior: Clip.antiAlias,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        goal.description,
                        style: GoogleFonts.chewy(
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Image.asset(
                        goal.assetPath,
                        color: Colors.white.withOpacity(0.3),
                        colorBlendMode: BlendMode.modulate,
                        height: 100,
                      ),
                    ],
                  ),
                  Text(
                    frequencyToLabelMap[widget.goal.frequency]!,
                    style: GoogleFonts.chewy(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
