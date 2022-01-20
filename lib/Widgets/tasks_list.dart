import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Widgets/tasks_tile.dart';
import 'package:to_do_app/model/tasklist_provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(15),
      //Accessing the tasklist through provider
      itemCount: Provider.of<TaskListProvider>(context).tasksList.length,
      itemBuilder: (context, index) {
        return TasksTile(
            index:
                index); //passing index so that it knows which task in tasklist
      },
    );
  }
}
