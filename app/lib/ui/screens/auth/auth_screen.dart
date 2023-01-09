import 'package:flutter/material.dart';
import 'package:goaly/ui/screens/auth/auth_app_bar.dart';
import 'package:goaly/ui/screens/auth/auth_card.dart';
import 'package:goaly/ui/widgets/infrastructure/fading_slide_transition.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AuthAppBarContent(),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadingSlideTransition(
                duration: const Duration(milliseconds: 1200),
                startDelay: const Duration(milliseconds: 1300),
                beginOffset: const Offset(0, 2),
                children: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: const Text(
                    "Take control over your time and manage your habits. "
                    "The app will intelligently schedule your goals and objective so you can enjoy more free time.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      wordSpacing: 2,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const AuthCard(),
            ],
          ),
        ),
      ),
    );
  }
}
