import 'package:flutter/material.dart';
import 'package:goaly/ui/widgets/infrastructure/time_list_tile.dart';

class SameTimeEverydayForm extends StatefulWidget {
  const SameTimeEverydayForm({Key? key}) : super(key: key);

  @override
  State<SameTimeEverydayForm> createState() => _SameTimeEverydayFormState();
}

class _SameTimeEverydayFormState extends State<SameTimeEverydayForm> {
  TimeOfDay _time = const TimeOfDay(hour: 12, minute: 0);

  void _onTimeChanged(TimeOfDay newTime) async {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TimeListTile(
      time: _time,
      label: const Text(
        "Time of day",
        style: TextStyle(fontSize: 20),
      ),
      trailing: Align(
        alignment: Alignment.centerRight,
        child: Text(
          _time.format(context),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      onTimeChanged: _onTimeChanged,
    );
  }
}
