import 'package:flutter/material.dart';
import 'package:goaly/domain/goal_frequency.dart';

class FrequencyDropdown extends StatelessWidget {
  final Function(GoalFrequency? value)? onSaved;

  const FrequencyDropdown({Key? key, this.onSaved}) : super(key: key);

  String? _requiredValidator(GoalFrequency? value) {
    return value == null ? 'Frequency of day is required.' : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<GoalFrequency>(
      validator: _requiredValidator,
      onSaved: onSaved,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Frequency',
      ),
      items: [
        _FrequencyMenuItem(frequency: GoalFrequency.weekly),
        _FrequencyMenuItem(frequency: GoalFrequency.twicePerWeek),
        _FrequencyMenuItem(frequency: GoalFrequency.threeTimesPerWeek),
        _FrequencyMenuItem(frequency: GoalFrequency.daily),
        _FrequencyMenuItem(frequency: GoalFrequency.monthly),
      ],
      onChanged: onSaved,
    );
  }
}

class _FrequencyMenuItem extends DropdownMenuItem<GoalFrequency> {
  _FrequencyMenuItem({Key? key, required GoalFrequency frequency})
      : super(
          key: key,
          child: Text(frequencyToLabelMap[frequency]!),
          value: frequency,
        );
}

const Map<GoalFrequency, String> frequencyToLabelMap = {
  GoalFrequency.daily: 'Daily',
  GoalFrequency.threeTimesPerWeek: 'Three times per week',
  GoalFrequency.twicePerWeek: 'Two times per week',
  GoalFrequency.weekly: 'Once per week',
  GoalFrequency.monthly: 'Once per month',
};
