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
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkBoxCallBack: (bool? checkBoxState) {
                taskData.updateTask(task);
                /*setState(() {
                  widget.tasks[index].doneToggle();
                });Earlier this used to handle the the toogle of check boxes but after provider since most widgets become statless this also handled by provide,and since its a Consumer it will inevitably rebuild on notification*/
              },
              longPressCallBack: () {
                taskData.deleteTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    ); //the positions and locations of all the widgets reside in build contexr which help to render them
  }
}

//Consumer widget basically acts as a listener for changes in provider and simply rebuilds the entirity of its wrapping,Instead of this u can also use Provider.ofContext but this organizes codes better
