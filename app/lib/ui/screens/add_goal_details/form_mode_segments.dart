import 'package:flutter/material.dart';

class FormModeSegments extends StatelessWidget {
  final FormMode formMode;
  final Function(FormMode) onSelectionChanged;

  const FormModeSegments({
    Key? key,
    required this.formMode,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      selected: {formMode},
      onSelectionChanged: (values) {
        onSelectionChanged(values.first);
      },
    );
  }
}

enum FormMode {
  simple,
  advanced,
}
