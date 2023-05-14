import 'package:flutter/material.dart';
import 'package:goaly/services/authentication/authentication_service.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthenticationService>();

    return NavigationDrawer(
      selectedIndex: 1,
      children: [
        DrawerHeader(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 20,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                  NetworkImage(authService.currentUser.photoURL!),
                ),
                Text(authService.currentUser.displayName!)
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          label: Text('Profile'),
          icon: Icon(Icons.account_circle_outlined),
        ),
        const NavigationDrawerDestination(
          label: Text('Current goals'),
          icon: Icon(Icons.star),
        ),
        const NavigationDrawerDestination(
          label: Text('Completed goals'),
          icon: Icon(Icons.done),
        ),
        const NavigationDrawerDestination(
          label: Text('Settings'),
          icon: Icon(Icons.settings),
        ),
        const Divider(indent: 20, endIndent: 20),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              title: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Log out"),
              ),
              onTap: () async {
                final navigator = Navigator.of(context);
                await authService.logOut();
                navigator.pushReplacement(
                    MaterialPageRoute(builder: (_) => const AuthScreen()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
