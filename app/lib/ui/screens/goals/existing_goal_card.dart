import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';

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
      child: Consumer(
        builder: (_, WidgetRef ref, Widget? child) {
          final goalsDescriptions = ref.watch(goalDescriptionProvider);
          final goal = goalsDescriptions.singleWhere(
              (element) => element.goalType == widget.goal.goalType);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(goal.description),
                  Image.asset(
                    goal.assetPath,
                    color: Colors.white.withOpacity(0.3),
                    colorBlendMode: BlendMode.modulate,
                    height: 100,
                  ),
                ],
              ),
              AnimatedContainer(
                height: isExpanded ? 0 : 100,
                duration: const Duration(milliseconds: 350),
                child: const Text("more"),
              )
            ],
          );
        },
      ),
    );
  }
}
