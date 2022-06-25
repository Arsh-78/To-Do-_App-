import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  final String taskTitle;
  final void Function(bool?) checkBoxCallBack;
  final void Function()? longPressCallBack;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkBoxCallBack,
      required this.longPressCallBack});

/*  void checkBoxCallback(bool? checkBoxState) {
    setState(() {
      isChecked =
          checkBoxState!; */ /*Since the isChecked will be used to update both checkbo and Text so we make the tile widget statefull,this makes us make the check box stateless,
      we cant really use setState() there but without that we cant really change the variable to we pass a CALLBACK from tile to box and use tile in that callback*/ /*
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.green,
        value: isChecked,
        onChanged: checkBoxCallBack,
        // onChanged: toggleCheckBoxState,
      ),
    );
  }
}
