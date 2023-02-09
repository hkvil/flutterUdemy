import 'package:flutter/material.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_provider.dart';

import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TaskProvider(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

