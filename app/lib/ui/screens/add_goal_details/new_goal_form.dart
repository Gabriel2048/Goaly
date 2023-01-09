import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/domain/goal.dart';
import 'package:goaly/domain/goal_frequency.dart';
import 'package:goaly/domain/goal_time_of_day.dart';
import 'package:goaly/services/goals_service.dart';
import 'package:goaly/ui/screens/add_goal_details/frequency_dropdown.dart';
import 'package:goaly/ui/screens/add_goal_details/time_of_day_dropdown.dart';

class NewGoalForm extends StatefulWidget {
  const NewGoalForm({Key? key}) : super(key: key);

  @override
  State<NewGoalForm> createState() => _NewGoalFormState();
}

class _NewGoalFormState extends State<NewGoalForm> {
  final _formKey = GlobalKey<FormState>();
  static const _timeOfDayKey = 'timeOfDay';
  static const _titleKey = 'title';
  static const _descriptionKey = 'description';

  final _spacing = const SizedBox(height: 40);

  final _formData = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: 'Gym',
            onSaved: (String? value) {
              _formData[_titleKey] = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title (required)',
            ),
          ),
          _spacing,
          FrequencyDropdown(
            onSaved: (GoalFrequency? value) {
              _formData[_timeOfDayKey] = value;
            },
          ),
          _spacing,
          TimeOfDayDropdown(
            onSaved: (GoalTimeOfDay? value) {
              _formData[_timeOfDayKey] = value;
            },
          ),
          _spacing,
          TextFormField(
            onSaved: (String? value) {
              _formData[_descriptionKey] = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description (optional)',
            ),
          ),
          _spacing,
          Consumer(
            builder: (_, ref, __) => ElevatedButton.icon(
              onPressed: () {
                final goalsService = ref.watch(goalsServiceProvider);

                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  goalsService.addGoal(Goal(
                    goalTimeOfDay: _formData[_timeOfDayKey],
                    title: _formData[_titleKey],
                    description: _formData[_descriptionKey],
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