import 'package:flutter/material.dart';
import 'package:to_do_app/model/task.dart';

//We need to create a class that extens ChangeNotifier so that the widgets that are listening GET NOTIFIED OF THE
//CHANGE IN DATA
class TaskListProvider extends ChangeNotifier {
  List<Task> tasksList = [
    Task(taskName: 'Wake up')
  ]; //this is the data that we want to make available to widgets across the widget tree

  //IF WE CHOOSE TO CHANGE THE ABOVE DATA AND WANT OUR WIDGETS TO UPDATE
  //u need to create a method to change the above value as we need to call the notifyListeners() to notify
  //the widget that the data has changed and to rebuild themselves
  void addTask(Task task) {
    tasksList.add(task);
    notifyListeners(); //DON'T FORGET THIS
  }

  void updateCompleteStatus(bool isComplete, int index) {
    tasksList[index].isCompleted = isComplete;
    notifyListeners(); //DON'T FORGET THIS
  }
  void deleteTask(int index) {
    tasksList.removeAt(index);
    notifyListeners(); //DON'T FORGET THIS
  }
}
