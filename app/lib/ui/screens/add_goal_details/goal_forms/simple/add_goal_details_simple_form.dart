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
  static const _timeOfDayKey = 'timeOfDay';
  static const _frequencyKey = 'frequency';
  static const _titleKey = 'title';

  final _formData = {};

  @override
  Widget build(BuildContext context) {
    final hasTitleConfigurable = Provider.of<GoalFormProvider>(context, listen: false).hasTitleConfigurable;
    const spacing = SizedBox(height: 40);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (hasTitleConfigurable)
            TextFormField(
              onSaved: (String? value) {
                _formData[_titleKey] = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          if (hasTitleConfigurable) spacing,
          FrequencyDropdown(
            onSaved: (GoalFrequency? value) {
              _formData[_frequencyKey] = value;
            },
          ),
          spacing,
          TimeOfDayDropdown(
            onSaved: (GoalTimeOfDay? value) {
              _formData[_timeOfDayKey] = value;
            },
          ),
          spacing,
          spacing,
          ElevatedButton.icon(
            onPressed: () {
              // final goalsService = ref.watch(goalsServiceProvider);
              //
              // if (_formKey.currentState?.validate() ?? false) {
              //   _formKey.currentState?.save();
              //   goalsService.addGoal(AddGoalModel(
              //     title: widget.hasTitleConfigurable
              //         ? _formData[_titleKey]
              //         : null,
              //   ));
              // }
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.add),
            ),
            label: const Padding(
              padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
              child: Text('Add your goal'),
            ),
          )
        ],
      ),
    );
  }
}
