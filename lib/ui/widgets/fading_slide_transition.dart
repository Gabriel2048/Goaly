import 'package:flutter/material.dart';

class FadingSlideTransition extends StatefulWidget {
  final Duration duration;
  final Duration startDelay;
  final Widget children;
  final Offset beginOffset;
  final Offset endOffset;

  const FadingSlideTransition(
      {Key? key,
      required this.duration,
      required this.children,
      required this.beginOffset,
      this.startDelay = Duration.zero,
      this.endOffset = const Offset(0, 0)})
      : super(key: key);

  @override
  State<FadingSlideTransition> createState() => _FadingSlideTransitionState();
}

class _FadingSlideTransitionState extends State<FadingSlideTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.startDelay).then((value) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.stop();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.beginOffset,
        end: widget.endOffset,
      ).animate(_controller),
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _controller,
          curve: Curves.easeIn,
        ),
        child: widget.children,
      ),
    );
  }
}
