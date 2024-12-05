import 'package:flutter/material.dart';
import 'package:fstatemgttutorial/provider/provider.dart';
import 'package:provider/provider.dart';

class FirstProviderEdit extends StatefulWidget {
  final TaskData taskData;
  //The taskIndex allows the widget to know which task the user intends to edit.
  final int taskIndex;
  const FirstProviderEdit({
    super.key,
    required this.taskData,
    required this.taskIndex,
  });

  @override
  State<FirstProviderEdit> createState() => _FirstProviderEditState();
}

class _FirstProviderEditState extends State<FirstProviderEdit> {
  late TextEditingController tasktitleController;
  late TextEditingController taskDescriptionController;

  @override
  void initState() {
    tasktitleController =
        TextEditingController(text: widget.taskData.taskTitle);
    taskDescriptionController =
        TextEditingController(text: widget.taskData.taskDescription);
    super.initState();
  }

  @override
  void dispose() {
    tasktitleController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskdataProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //tasktitle
            const Text('Task Title'),
            TextField(
              controller: tasktitleController,
            ),
            const SizedBox(height: 20.0),
            //task
            const Text('Task'),
            TextField(
              controller: taskDescriptionController,
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                //taskdataProvider.updateTask(widget.index, updatedTask);
                final updatedTask = TaskData(
                  taskTitle: tasktitleController.text,
                  taskDescription: taskDescriptionController.text,
                );
                taskdataProvider.updateTask(
                  //The taskIndex allows the widget to know which task the user intends to edit.
                  widget.taskIndex, 
                  updatedTask
                );
                Navigator.pop(context);

                //clear
                tasktitleController.clear();
                taskDescriptionController.clear();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
