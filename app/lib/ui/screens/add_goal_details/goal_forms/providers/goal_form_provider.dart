import 'package:flutter/material.dart';
import 'package:goaly/domain/goal_type.dart';

class GoalFormProvider extends ChangeNotifier{
  late GoalType goalType;

  bool get hasTitleConfigurable => goalType == GoalType.custom;

  void setGoalType(GoalType goalType){
    this.goalType = goalType;
  }
}