import 'package:flutter/material.dart';

import '../modals/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Complete Flutter Course'),
    Task(name: 'Start Shuttle Tracker'),
    Task(name: 'Do some DSA')
  ];

  void addTask(String newTaskTitle) {
    tasks.add(
      Task(name: newTaskTitle),
    );
  }
}
