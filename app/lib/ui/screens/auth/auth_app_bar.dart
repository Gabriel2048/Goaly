import 'package:flutter/material.dart';

class AuthAppBarContent extends StatelessWidget {
  const AuthAppBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Object>(
        future: Future<double>.value(1000),
        initialData: 0.0,
        builder: (context, snapshot) {
          return AnimatedContainer(
            width: snapshot.data as double,
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
          );
        }
      ),
    );
  }
}
