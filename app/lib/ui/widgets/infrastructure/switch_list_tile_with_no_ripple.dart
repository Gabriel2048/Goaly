import 'package:flutter/material.dart';

class SwitchListTileWithNoRipple extends StatelessWidget {
  final bool value;
  final Widget label;
  final Function() onTap;

  const SwitchListTileWithNoRipple({
    super.key,
    required this.value,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: label,
          ),
        ),
        Switch(
          value: value,
          onChanged: (_) {
            onTap();
          },
        ),
      ],
    );
  }
}
