import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskData> _taskdata = [];
  List<TaskData> get taskdata => _taskdata;

//add
  void add(TaskData taskdata) {
    _taskdata.add(taskdata);
    notifyListeners();
  }

//remove
  void removeAt(int index){
    _taskdata.removeAt(index);
    notifyListeners();
  }

  //update
  void updateTask(int index,  TaskData updatedTask){
    _taskdata[index] = updatedTask;
    notifyListeners();
  }
}

//model class
class TaskData {
  final String taskTitle;
  final String taskDescription;

  TaskData({
    required this.taskTitle,
    required this.taskDescription,
  });
}
