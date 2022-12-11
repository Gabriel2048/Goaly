import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/new_goal/time_of_day_dropdown.dart';

class NewGoalForm extends StatefulWidget {
  const NewGoalForm({Key? key}) : super(key: key);

  @override
  State<NewGoalForm> createState() => _NewGoalFormState();
}

class _NewGoalFormState extends State<NewGoalForm> {
  final _formKey = GlobalKey<FormState>();

  final _spacing = const SizedBox(height: 40);

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
            items: const [
              DropdownMenuItem(
                value: '321',
                child: Text('123'),
              )
            ],
            onChanged: (String? value) {},
          ),
          _spacing,
          const TimeOfDayDropdown(),
          _spacing,
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description (optional)',
            ),
          ),
          _spacing,
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.add),
            ),
            label: const Padding(
              padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
              child: Text('Add your goal'),
            ),
          ),
        ],
      ),
    );
  }
}
