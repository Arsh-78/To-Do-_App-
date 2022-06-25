import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/tasks_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: Provider.of<TasksData>(context).tasks[index].isDone,
            taskTitle: Provider.of<TasksData>(context).tasks[index].name,
            checkBoxCallBack: (bool? checkBoxState) {
              /*setState(() {
                widget.tasks[index].doneToggle();
              });*/
            });
      },
      itemCount: Provider.of<TasksData>(context).tasks.length,
    ); //the positions and locations of all the widgets reside in build contexr which help to render them
  }
}
