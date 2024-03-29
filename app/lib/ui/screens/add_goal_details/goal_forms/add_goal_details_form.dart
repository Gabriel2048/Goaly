import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/time_form/day_picker/day_picker.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/time_form/goal_scheduler.dart';
import 'package:provider/provider.dart';

class AddGoalDetailsForm extends StatelessWidget {
  const AddGoalDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalFormProvider = Provider.of<GoalFormProvider>(context);
    final hasTitleConfigurable = goalFormProvider.hasTitleConfigurable;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          if (hasTitleConfigurable) ...[
            TextFormField(
              onChanged: goalFormProvider.setTitle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          const DayPicker(),
          const SizedBox(
            height: 20,
          ),
          const GoalScheduler()
        ],
      ),
    );
  }
}
