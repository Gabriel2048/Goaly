import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/new_goal/time_of_day_dropdown.dart';

class NewGoalForm extends StatefulWidget {
  const NewGoalForm({Key? key}) : super(key: key);

  @override
  State<NewGoalForm> createState() => _NewGoalFormState();
}

class _NewGoalFormState extends State<NewGoalForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Frequency',
            ),
            items: [
              DropdownMenuItem(
                child: Text('123'),
                value: '321',
              )
            ],
            onChanged: (String? value) {},
          ),
          const TimeOfDayDropdown(),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description (optional)',
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add your goal'),
          )
        ],
      ),
    );
  }
}
