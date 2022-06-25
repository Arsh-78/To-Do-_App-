import 'dart:collection';

import 'package:flutter/material.dart';

import '../modals/task.dart';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Complete Flutter Course'),
    Task(name: 'Start Shuttle Tracker'),
    Task(name: 'Do some DSA')
  ];
  int get taskCount {
    return _tasks.length;
  }

  void updateTask(Task task) {
    task.doneToggle();
    notifyListeners();
  }

  void deleteTask(int removeIndex) {
    _tasks.removeAt(removeIndex);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(
        _tasks); //basically an unmodifiable list,provlem with using tasks as private is tasks.index uses become error,making a normal getter return list is same as returning list ,ny returning this u make
    //sure that only additon to list can be done by addTask(hence subsequent notifier call inevitablly) and not list.add which causes error in first place
  }

  void addTask(String newTaskTitle) {
    _tasks.add(
      Task(name: newTaskTitle),
    );
    notifyListeners();
  }
}
