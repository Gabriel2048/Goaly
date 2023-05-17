import 'package:flutter/material.dart';
import 'package:goaly/providers/goals_descriptions_provider.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/simple/add_goal_details_simple_form.dart';
import 'package:goaly/ui/screens/add_goal_details/form_mode_segments.dart';
import 'package:goaly/ui/screens/add_goal_details/goal_forms/advanced/add_goal_details_advanced_form.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGoalDetailsScreen extends StatefulWidget {
  final GoalDescription goalDescription;

  const AddGoalDetailsScreen({
    Key? key,
    required this.goalDescription,
  }) : super(key: key);

  @override
  State<AddGoalDetailsScreen> createState() => _AddGoalDetailsScreenState();
}

class _AddGoalDetailsScreenState extends State<AddGoalDetailsScreen> {
  var _formMode = FormMode.simple;

  void _onFormModeSelectionChanged(FormMode mode) {
    setState(() {
      _formMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configure your goal",
          style: GoogleFonts.chewy(
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Hero(
          tag: widget.goalDescription.goalType,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.goalDescription.description,
                  style: GoogleFonts.chewy(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FormModeSegments(
                          formMode: _formMode,
                          onSelectionChanged: _onFormModeSelectionChanged,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        child: AnimatedCrossFade(
                          duration: const Duration(milliseconds: 150),
                          crossFadeState: _formMode == FormMode.simple
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: const AddGoalDetailsSimpleForm(),
                          secondChild: const AddGoalDetailsAdvancedForm(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
