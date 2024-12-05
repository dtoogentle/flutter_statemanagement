import 'package:flutter/material.dart';
import 'package:fstatemgttutorial/provider/provider.dart';
import 'package:provider/provider.dart';

class FirstProviderAdd extends StatefulWidget {
  const FirstProviderAdd({super.key});

  @override
  State<FirstProviderAdd> createState() => _FirstProviderAddState();
}

class _FirstProviderAddState extends State<FirstProviderAdd> {
   final tasktitleController = TextEditingController();
  final taskDescriptionController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskdataProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
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
                final addTask = TaskData(
                  taskTitle: tasktitleController.text,
                  taskDescription: taskDescriptionController.text,
                );

                taskdataProvider.add(addTask);
                Navigator.pop(context);

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
