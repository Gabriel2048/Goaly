import 'package:flutter/material.dart';
import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/simple/frequency_dropdown.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/simple/time_of_day_dropdown.dart';
import 'package:provider/provider.dart';

class AddGoalDetailsSimpleForm extends StatefulWidget {
  const AddGoalDetailsSimpleForm({Key? key}) : super(key: key);

  @override
  State<AddGoalDetailsSimpleForm> createState() =>
      _AddGoalDetailsSimpleFormState();
}

class _AddGoalDetailsSimpleFormState extends State<AddGoalDetailsSimpleForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final goalFormProvider = Provider.of<GoalFormProvider>(context);
    final hasTitleConfigurable = goalFormProvider.hasTitleConfigurable;

    const spacing = SizedBox(height: 40);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            if (hasTitleConfigurable) ...[
              TextFormField(
                onSaved: goalFormProvider.setTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              spacing
            ],
            FrequencyDropdown(
              onSaved: (GoalFrequency? value) {
              },
            ),
            spacing,
            TimeOfDayDropdown(
              onSaved: (GoalTimeOfDay? value) {
              },
            ),
          ],
        ),
      ),
    );
  }
}
