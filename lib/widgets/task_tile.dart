import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkBoxCallback(bool? checkBoxState) {
    setState(() {
      isChecked =
          checkBoxState!; /*Since the isChecked will be used to update both checkbo and Text so we make the tile widget statefull,this makes us make the check box stateless,
      we cant really use setState() there but without that we cant really change the variable to we pass a CALLBACK from tile to box and use tile in that callback*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Sample Task',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckBox(
        checkedBoxState: isChecked,
        toggleCheckBoxState: checkBoxCallback,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkedBoxState;
  final void Function(bool?) toggleCheckBoxState;

  TaskCheckBox(
      {required this.checkedBoxState, required this.toggleCheckBoxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.green,
      value: checkedBoxState,
      onChanged: toggleCheckBoxState,
    );
  }
}
