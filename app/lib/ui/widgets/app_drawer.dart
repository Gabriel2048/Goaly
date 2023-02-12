import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/services/authentication/authentication_service.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authenticationServiceProvider);
    final user = authService.currentUser;

    return NavigationDrawer(
      children: [
        DrawerHeader(
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 20,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                Text(user.displayName!)
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          label: Text('Profile'),
          icon: Icon(Icons.account_circle_outlined),
        ),
        const NavigationDrawerDestination(
          label: Text('Completed goals'),
          icon: Icon(Icons.done),
        ),
        const NavigationDrawerDestination(
          label: Text('Settings'),
          icon: Icon(Icons.settings),
        ),
        const Divider(),
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
