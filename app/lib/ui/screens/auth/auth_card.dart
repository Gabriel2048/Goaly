import 'package:flutter/material.dart';
import 'package:goaly/services/authentication/authentication_service.dart';
import 'package:goaly/ui/screens/goals/goals_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> with TickerProviderStateMixin {
  late final AnimationController _signInController = AnimationController(
    duration: const Duration(milliseconds: 1200),
    vsync: this,
  );

  @override
  void dispose() {
    super.dispose();
    _signInController.stop();
    _signInController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      _signInController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return FadeTransition(
      opacity: CurvedAnimation(
        parent: _signInController,
        curve: Curves.easeIn,
      ),
      child: SizedBox(
        height: deviceSize.height * 0.3,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
              bottom: Radius.circular(0),
            ),
          ),
          child: Center(
            child: Consumer<AuthenticationService>(
              builder: (ctx, auth, _) {
                return ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(230, 60)),
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    final credentials = await auth.startGoogleAuth();
                    if (credentials != null) {
                      navigator.pushReplacementNamed(GoalsScreen.routeName);
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.google),
                  label: const Text("Sign in with Google"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
