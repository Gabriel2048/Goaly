import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/form_mode.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/providers/goal_form_provider.dart';
import 'package:provider/provider.dart';

class FormModeSegments extends StatelessWidget {
  const FormModeSegments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalFormProvider>(context);

    return SegmentedButton<FormMode>(
      segments: const [
        ButtonSegment<FormMode>(
          value: FormMode.simple,
          label: Text("Simple"),
          icon: Icon(Icons.event_available),
        ),
        ButtonSegment<FormMode>(
          value: FormMode.advanced,
          label: Text("Advanced"),
          icon: Icon(Icons.settings),
        ),
      ],
      selected: {goalProvider.formMode},
      onSelectionChanged: (values) {
        goalProvider.setFormMode(values.first);
      },
    );
  }
}
