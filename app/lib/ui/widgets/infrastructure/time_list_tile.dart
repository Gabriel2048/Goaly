import 'package:flutter/material.dart';

class TimeListTile extends StatelessWidget {
  final TimeOfDay time;
  final Widget label;
  final Widget trailing;
  final void Function(TimeOfDay)? onTimeChanged;

  const TimeListTile({
    Key? key,
    this.time = const TimeOfDay(hour: 12, minute: 0),
    required this.label,
    required this.trailing,
    this.onTimeChanged,
  }) : super(key: key);

  void _onTimeTap(BuildContext context) async {
    final pickedTime = await showTimePicker(context: context, initialTime: time);
    if (pickedTime != null && onTimeChanged != null) {
      onTimeChanged!(pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
