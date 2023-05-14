import 'package:flutter/material.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/main.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/services/goaly_gollections.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/simple/frequency_dropdown.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ExistingGoalCard extends StatefulWidget {
  final Goal goal;

  const ExistingGoalCard({Key? key, required this.goal}) : super(key: key);

  @override
  State<ExistingGoalCard> createState() => _ExistingGoalCardState();
}

class _ExistingGoalCardState extends State<ExistingGoalCard> with RouteAware {
  bool isExpanded = false;
  static const padding = 18.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
      },
    );
  }

  Future<bool> _handleConfirmDismiss(DismissDirection direction) async {
    final canDelete = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Deleting your goal?"),
        content: const Text(
            "Your are about to delete this goal. This actions is irreversible."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );

    return canDelete ?? false;
  }

  Future<void> _handleDismissed(DismissDirection direction) async {
    await GoalyCollections.goalsOfCurrentUser.doc(widget.goal.id).delete();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    setState(() {
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final goalDescription = goalsDescriptions
        .singleWhere((element) => element.goalType == widget.goal.goalType);

    return Dismissible(
      key: Key(widget.goal.id),
      confirmDismiss: _handleConfirmDismiss,
      onDismissed: _handleDismissed,
      child: TappableCard(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: isExpanded ? 200 : 100,
          child: Wrap(
            runAlignment: WrapAlignment.spaceEvenly,
            clipBehavior: Clip.antiAlias,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goalDescription.description,
                      style: GoogleFonts.chewy(
                        textStyle:
                        Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Image.asset(
                      goalDescription.assetPath,
                      color: Colors.white.withOpacity(0.3),
                      colorBlendMode: BlendMode.modulate,
                      height: 100,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      frequencyToLabelMap[GoalFrequency.threeTimesPerWeek]!,
                      style: GoogleFonts.chewy(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Check progress'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
