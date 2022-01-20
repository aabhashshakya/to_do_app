import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/model/tasklist_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String inputText = '';
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
          ),
          TextField(
            onChanged: (newString) {
              inputText = newString;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.assignment_outlined,
                color: Colors.lightBlueAccent,
              ),
              hintText: 'Enter your task here',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1)),
              hintStyle: (TextStyle(color: Colors.grey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RawMaterialButton(
              elevation: 10,
              onPressed: () {
                if (inputText != '' && inputText != null) {
                  //updating the tasklist through Provider class and accessing its method
                  //we pass here listen = false as the onPressed() event doesnt really need to care about any changes to
                  //tha value, it is just updating it that's all
                  Provider.of<TaskListProvider>(context, listen: false)
                      .addTask(Task(taskName: inputText));
                  Navigator.pop(context); //pop this to goto main screen
                }
              },
              fillColor: Colors.lightBlueAccent,
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              padding: EdgeInsets.all(60.0),
              shape: CircleBorder(),
            ),
          )
        ],
      ),
    );
  }
}
