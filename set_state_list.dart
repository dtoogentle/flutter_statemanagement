import 'package:flutter/material.dart';

class SetStateList extends StatefulWidget {
  const SetStateList({super.key});

  @override
  State<SetStateList> createState() => _SetStateListState();
}

class _SetStateListState extends State<SetStateList> {
  final List<InfoData> infodata = [];

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    ageController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the list of data
            Expanded(
              child: ListView.builder(
                itemCount: infodata.length,
                itemBuilder: (context, index) {
                  final item = infodata[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age: ${item.age}'),
                        Text('Height: ${item.height}'),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            // Input fields
            const Text('Name'),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10.0),
            const Text('Age'),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            const Text('Height'),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            // Add button
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final ageText = ageController.text;
                final heightText = heightController.text;

                if (name.isEmpty || ageText.isEmpty || heightText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                setState(() {
                  infodata.add(
                    InfoData(
                      name: name,
                      age: int.tryParse(ageText) ?? 0,
                      height: double.tryParse(heightText) ?? 0.0,
                    ),
                  );
                });

                // Clear the input fields
                nameController.clear();
                ageController.clear();
                heightController.clear();
              },
              child: const Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoData {
  final String name;
  final int age;
  final double height;

  InfoData({
    required this.name,
    required this.age,
    required this.height,
  });
}
