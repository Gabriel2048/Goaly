import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/day_picker.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/time_form/frequency_form.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:provider/provider.dart';

class AddGoalDetailsAdvancedForm extends StatelessWidget {
  const AddGoalDetailsAdvancedForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasTitleConfigurable =
        Provider.of<GoalFormProvider>(context, listen: false)
            .hasTitleConfigurable;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          if (hasTitleConfigurable) ...[
            TextFormField(
              onSaved: (String? value) {},
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
          const TimeForm()
        ],
      ),
    );
  }
}
