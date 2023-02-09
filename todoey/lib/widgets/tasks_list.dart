import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  TasksList({required this.tasksInTasksList,required this.callback});
  final List<Task> tasksInTasksList;
  final callback;



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasksInTasksList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: tasksInTasksList[index].name,
            isChecked: tasksInTasksList[index].isDone,
            checkboxCallback: (newValue){
              callback(index);
            },
          );
        });
  }
}
