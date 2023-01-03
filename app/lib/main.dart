import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goaly/firebase_options.dart';
import 'package:goaly/services/authentication/authentication_service.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';
import 'package:goaly/ui/screens/goals/goals_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goaly/ui/screens/new_goal/new_goal_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFunctions.instance.useFunctionsEmulator("192.168.0.106", 5001);
  FirebaseAuth.instance.useAuthEmulator("192.168.0.106", 9099);
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
      initialRoute: authService.isLoggedIn ? GoalsScreen.route : AuthScreen.route,
      routes: {
        GoalsScreen.route: (_) => const GoalsScreen(),
        AuthScreen.route: (_) => const AuthScreen(),
        NewGoalScreen.route: (_) => const NewGoalScreen(),
      },
      // home: const LandingScreen(),
    );
  }
}
