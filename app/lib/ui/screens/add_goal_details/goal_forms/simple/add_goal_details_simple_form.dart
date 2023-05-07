import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/domain/goal_type.dart';
import 'package:goaly/services/goals/add_goal_model.dart';
import 'package:goaly/services/goals/goals_service.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/simple/frequency_dropdown.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/simple/time_of_day_dropdown.dart';

class AddGoalDetailsSimpleForm extends StatefulWidget {
  final GoalType goalType;

  get hasTitleConfigurable => goalType == GoalType.custom;

  const AddGoalDetailsSimpleForm({Key? key, required this.goalType})
      : super(key: key);

  @override
  State<AddGoalDetailsSimpleForm> createState() => _AddGoalDetailsSimpleFormState();
}

class _AddGoalDetailsSimpleFormState extends State<AddGoalDetailsSimpleForm> {
  final _formKey = GlobalKey<FormState>();
  static const _timeOfDayKey = 'timeOfDay';
  static const _frequencyKey = 'frequency';
  static const _titleKey = 'title';

  final _formData = {};

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(height: 40);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (widget.hasTitleConfigurable)
            TextFormField(
              onSaved: (String? value) {
                _formData[_titleKey] = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          if (widget.hasTitleConfigurable) spacing,
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
          Consumer(
            builder: (_, ref, __) => ElevatedButton.icon(
              onPressed: () {
                final goalsService = ref.watch(goalsServiceProvider);

                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  goalsService.addGoal(AddGoalModel(
                    timeOfDay: _formData[_timeOfDayKey],
                    frequency: _formData[_frequencyKey],
                    title: widget.hasTitleConfigurable
                        ? _formData[_titleKey]
                        : null,
                    goalType: widget.goalType,
                  ));
                }
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.add),
              ),
              label: const Padding(
                padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                child: Text('Add your goal'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}