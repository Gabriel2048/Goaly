import 'package:cloud_functions/cloud_functions.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goaly/firebase_options.dart';
import 'package:goaly/infrastructure/providers/application_providers.dart';
import 'package:goaly/infrastructure/providers/services_providers.dart';
import 'package:goaly/services/authentication/authentication_service.dart';
import 'package:goaly/services/notifications/notification_service.dart';
import 'package:goaly/ui/screens/add_goal/add_goal_screen.dart';
import 'package:goaly/ui/screens/auth/auth_screen.dart';
import 'package:goaly/ui/screens/goal_progress/goal_progress_screen.dart';
import 'package:goaly/ui/screens/goals/goals_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: await DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationsService.initApplication();
  FirebaseFunctions.instance.useFunctionsEmulator("192.168.0.104", 5001);
  // FirebaseAuth.instance.useAuthEmulator("192.168.0.104", 9099);
  // FirebaseFirestore.instance.useFirestoreEmulator("192.168.0.104", 8080);
  runApp(MultiProvider(
    providers: [
      ...servicesProviders,
      ...applicationProviders,
    ],
    child: const MyApp(),
  ));
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (_, ColorScheme? dark) => Consumer<AuthenticationService>(
        builder: (_, authService, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Goaly',
          navigatorObservers: [routeObserver],
          theme: ThemeData.from(
            colorScheme: dark ?? const ColorScheme.dark(),
            useMaterial3: true,
          ),
          routes: {
            GoalsScreen.routeName: (_) => const GoalsScreen(),
            AuthScreen.routeName: (_) => const AuthScreen(),
            AddGoalScreen.routeName: (_) => const AddGoalScreen(),
            GoalProgressScreen.routeName: (_) => const GoalProgressScreen(),
          },
          initialRoute: authService.isLoggedIn
              ? GoalsScreen.routeName
              : AuthScreen.routeName,
        ),
      ),
    );
  }
}
