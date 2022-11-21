
import 'package:flutter/material.dart';

class AuthAppBarContent extends StatefulWidget {
  const AuthAppBarContent({Key? key}) : super(key: key);

  @override
  State<AuthAppBarContent> createState() => _AuthAppBarContentState();
}

class _AuthAppBarContentState extends State<AuthAppBarContent> {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _width = 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        width: _width,
        duration: const Duration(milliseconds: 7000),
        curve: Curves.ease,
        child: const Center(
          child: Text(
            "Welcome to Goaly",
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              wordSpacing: 2,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
