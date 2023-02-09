import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> tasks = [
    Task(name: 'Learn Flutter'),
    Task(name: 'Go to school'),
    Task(name: 'Task nomber 3')
  ];

  void addTask(String newTask){
    tasks.add(Task(name: newTask));
    notifyListeners();
  }
  void updateTask(Task task){
    task.tooglesCheckbox();
    notifyListeners();
  }
  void deleteTask(int index){
    tasks.removeAt(index);
    notifyListeners();
  }
}