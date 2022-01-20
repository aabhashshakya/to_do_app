import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/tasklist_provider.dart';

class TasksTile extends StatelessWidget {
  int index;

  TasksTile({this.index});

  @override
  Widget build(BuildContext context) {
    //Use a widget inside a consumer if you know its gonna use the Provider.of many times
    //use the build method to return the required object, it has a parameter that's the TaskListProvider so u can
    //access it easier without using the lengthy syntax
    return Consumer<TaskListProvider>(
        builder: (context, taskListProvider, child) {
      return ListTile(
          onLongPress: () {
            taskListProvider.deleteTask(index); //to delete a task
          },
          //see the code is much shorter now
          title: Text(taskListProvider.tasksList[index].taskName,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Merienda',
                decoration: (taskListProvider.tasksList[index].isCompleted)
                    ? TextDecoration.lineThrough
                    : null,
              )),
          trailing: Checkbox(
              value: taskListProvider.tasksList[index].isCompleted,
              onChanged: (newValue) {
                //we pass here listen = false as the onChange() event doesn't really need to care about any changes to
                //tha value, it is just updating it that's all
                Provider.of<TaskListProvider>(context, listen: false)
                    .updateCompleteStatus(newValue, index);
              }));
    });
  }
}
