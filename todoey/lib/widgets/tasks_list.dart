import 'package:flutter/material.dart';
import 'package:todoey/models/task_provider.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context,taskData,child){
      return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              onLongPressCallback: (){
                taskData.deleteTask(index);
              },
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (newValue){
                taskData.updateTask(taskData.tasks[index]);
              },
            );
          });},
    );
  }
}
