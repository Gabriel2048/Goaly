import 'package:flutter/material.dart';
import 'package:goaly/services/notifications/notification_service.dart';
import 'package:goaly/ui/screens/goals/existing_goals_list.dart';
import 'package:goaly/ui/widgets/app_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsScreen extends StatefulWidget {
  static const routeName = '/goals';

  const GoalsScreen({Key? key}) : super(key: key);

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  Future<void> _onTapTest() async {
    await NotificationsService.ensurePermissions();
    // await NotificationsService.showNotification(
    //   id: 1,
    //   title: 'Going to the gym',
    //   body: 'Have you done it?',
    // );
    NotificationsService.scheduleWeeklyNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Goaly',
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 80),
        child: ExistingGoalsList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Add Goal',
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineSmall!,
          ),
        ),
        icon: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _onTapTest();
          // Navigator.pushNamed(context, AddGoalScreen.routeName);
        },
      ),
    );
  }
}
