import 'package:flutter/material.dart';

class TimeOfDayDropdown extends StatelessWidget {
  const TimeOfDayDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Time of day',
      ),
      items: const [
        DropdownMenuItem(
          value: 'Morning',
          child: Text('Morning'),
        ),
        DropdownMenuItem(
          value: 'Midday',
          child: Text('Midday'),
        ),
        DropdownMenuItem(
          value: 'Evening',
          child: Text('Evening'),
        ),
        DropdownMenuItem(
          value: 'Anytime',
          child: Text('Anytime'),
        )
      ],
      onChanged: (String? value) {},
    );
  }
}
