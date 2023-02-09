import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatelessWidget {//NO
  TaskTile({required this.isChecked,required this.taskTitle,required this.checkboxCallback});

  final bool isChecked ;
  final String taskTitle;
  final checkboxCallback;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,style: TextStyle(decoration:isChecked ?TextDecoration.lineThrough:TextDecoration.none ),),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged:checkboxCallback)
    );
  }
}

// onChangedCheckbox(newValue) {
//   setState(() {
//     isChecked = newValue;
//   });
// }

