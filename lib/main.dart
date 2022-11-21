import 'package:flutter/material.dart';
import 'package:goaly/firebase_options.dart';
import 'package:goaly/services/authentication_service.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';
import 'package:goaly/ui/screens/loggedin/logged_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authenticationServiceProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goaly',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      initialRoute: authService.isLoggedIn() ? LoggedInScreen.route : AuthScreen.route,
      routes: {
        LoggedInScreen.route: (_) => const LoggedInScreen(),
        AuthScreen.route: (_) => const AuthScreen(),
      },
      // home: const LandingScreen(),
    );
  }
}
