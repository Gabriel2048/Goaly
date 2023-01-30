import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final void Function()? onTap;
  final borderRadius = 12.0;

  const TappableCard({
    required this.child,
    this.onTap,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
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
