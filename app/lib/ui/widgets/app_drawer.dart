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
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ListTile(
              title: const Text("Log out"),
              onTap: () async {
                final navigator = Navigator.of(context);
                await authService.logOut();
                navigator.pushReplacementNamed(AuthScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
