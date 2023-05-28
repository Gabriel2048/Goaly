import 'package:goaly/services/goals/goals_service.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:provider/provider.dart';

final applicationProviders = [
  ChangeNotifierProvider(
    create: (context) =>
        GoalFormProvider(Provider.of<GoalsService>(context, listen: false)),
  )
];
