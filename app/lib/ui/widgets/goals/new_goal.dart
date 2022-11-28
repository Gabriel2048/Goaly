import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/services/goals_service.dart';
import 'package:goaly/ui/widgets/infrastructure/tappable_card.dart';

class NewGoal extends ConsumerWidget {
  const NewGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsService = ref.watch(goalsServiceProvider);
    return TappableCard(
      height: 150,
      width: 150,
      onTap: goalsService.addGoal,
      child: Icon(Icons.add)
    );
  }
}
