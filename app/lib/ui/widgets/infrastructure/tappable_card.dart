import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final void Function()? onTap;

  const TappableCard({
    required this.child,
    this.onTap,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
