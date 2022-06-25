import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/tasks_data.dart';
import 'package:todo_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context /*where u are in the tree*/,
          taskData /*Equivalent to Provider.of<TasksData>(context)*/, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkBoxCallBack: (bool? checkBoxState) {
                  /*setState(() {
                  widget.tasks[index].doneToggle();
                });*/
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    ); //the positions and locations of all the widgets reside in build contexr which help to render them
  }
}

//Consumer widget basically acts as a listener for changes in provider and simply rebuilds the entirity of its wrapping,Instead of this u can also use Provider.ofContext but this organizes codes better
