import 'package:flutter/material.dart';
import 'package:fstatemgttutorial/provider/first_example/first_provider_add.dart';
import 'package:fstatemgttutorial/provider/first_example/first_provider_edit.dart';
import 'package:fstatemgttutorial/provider/provider.dart';
import 'package:provider/provider.dart';

class FirstProviderExample extends StatefulWidget {
  const FirstProviderExample({super.key});

  @override
  State<FirstProviderExample> createState() => _FirstProviderExampleState();
}

class _FirstProviderExampleState extends State<FirstProviderExample> {
  @override
  Widget build(BuildContext context) {
    final taskdataProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Provider Example'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: taskdataProvider.taskdata.length,
          itemBuilder: (context, index) {
            final item = taskdataProvider.taskdata[index];
            return ListTile(
              leading:
                  //edit button
                  IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FirstProviderEdit(
                        taskData: item,
                        //The taskIndex allows the widget to know which task the user intends to edit.
                        taskIndex: index,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  size: 15.0,
                ),
              ),
              //title
              title: Text(item.taskTitle.toUpperCase()),
              //description
              subtitle: Text(item.taskDescription),
              trailing:
                  //delete button
                  IconButton(
                onPressed: () => taskdataProvider.removeAt(index),
                icon: const Icon(
                  Icons.delete,
                  size: 15.0,
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const FirstProviderAdd(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
