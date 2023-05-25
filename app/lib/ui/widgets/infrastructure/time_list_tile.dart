import 'package:flutter/material.dart';

class TimeListTile extends StatelessWidget {
  final TimeOfDay pickerInitialTime;
  final Widget label;
  final Widget trailing;
  final CrossAxisAlignment crossAxisAlignment;
  final void Function(TimeOfDay)? onTimeChanged;

  const TimeListTile({
    Key? key,
    this.pickerInitialTime = const TimeOfDay(hour: 12, minute: 0),
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.label,
    required this.trailing,
    this.onTimeChanged,
  }) : super(key: key);

  void _onTimeTap(BuildContext context) async {
    final pickedTime = await showTimePicker(context: context, initialTime: pickerInitialTime);
    if (pickedTime != null && onTimeChanged != null) {
      onTimeChanged!(pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        label,
        Expanded(
          child: GestureDetector(
            onTap: () => _onTimeTap(context),
            child: trailing,
          ),
        ),
      ],
    );
  }
}
