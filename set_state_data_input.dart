import 'package:flutter/material.dart';

class SetStateDataInput extends StatefulWidget {
  const SetStateDataInput({super.key});

  @override
  State<SetStateDataInput> createState() => _SetStateDataInputState();
}

class _SetStateDataInputState extends State<SetStateDataInput> {
  final fullnameController = TextEditingController();
  final phonenumberController = TextEditingController();
  final ageController = TextEditingController();

  String _fullname = '';
  int _phonenumber = 0;
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState Data Input'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //DATA DISPLAY
              Text('Full Name: $_fullname'),
              Text('Phone Number: ${_phonenumber}'),
              Text('Phone Number: ${_age}'),
              const SizedBox(height: 20.0),
              //full name
              const Text('Full Name'),
              TextField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20.0),
              //phone number
              const Text('Phone Number'),
              TextField(
                controller: phonenumberController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              //age
              const Text('Age'),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
              ),
              //Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fullname = fullnameController.text;
                    _phonenumber = int.parse(phonenumberController.text);
                    _age = int.parse(ageController.text);
                  });
                  fullnameController.clear();
                  phonenumberController.clear();
                  ageController.clear();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
