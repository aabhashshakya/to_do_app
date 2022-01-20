import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Widgets/tasks_list.dart';
import 'package:to_do_app/model/tasklist_provider.dart';
import 'package:to_do_app/screens/add_tasks_screen.dart';

TextEditingController controller = TextEditingController();

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //state provider provides ur TaskList object through which we can access our state(i.e. a tasks list)
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 40, top: 60, bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.list,
                            color: Colors.lightBlueAccent,
                            size: 60,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'To-do App',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        '${Provider.of<TaskListProvider>(context).tasksList.length} Tasks',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ])),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: TasksList(), //passing in the task list
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          //bottomsheet pops up from the bottom
          //2 kinds: persistent: it is always displayed, modal: it is displayed only when something happens
          showModalBottomSheet(
              isScrollControlled:
                  true, //prevents overflow//make the bottomsheet take however much space it needs
              //if ur bottomsheet is a column make sure minAxis:min and dont wrap with Center otherwise bottom
              //sheet will take the entire screen
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              context: context,
              builder: (context) => AddTaskScreen());
        },
      ),
    );
  }
}
