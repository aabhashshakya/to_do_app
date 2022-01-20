import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/tasklist_provider.dart';
import 'package:to_do_app/screens/tasks_screen.dart';

//THIS IS THE VERSION OF THE TO DO APP WITH STATE MANAGEMENT
//WE USE PROVIDER AND CHANGE NOTIFIER HERE
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //the provider is at the top of the widget tree so it can provide data to all the widget trees if needed
    //THE PROVIDER MUST BE ALWAYS HIGHER THAN ANY OF THE WIDGET THAT WISHES TO USE IT
    //I.E IT CANNOT BE INSIDE TASKSCREEN() HERE AS IT NEEDS TO USE THE PARAMETER
    return ChangeNotifierProvider<TaskListProvider>(
      create: (context) => TaskListProvider(),
      child: MaterialApp(
        home: TasksScreen(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlueAccent),
      ),
    );
  }
}
