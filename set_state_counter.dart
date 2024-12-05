import 'package:flutter/material.dart';

class SetStateCounter extends StatefulWidget {
  const SetStateCounter({super.key});

  @override
  State<SetStateCounter> createState() => _SetStateCounterState();
}

class _SetStateCounterState extends State<SetStateCounter> {
  int _counter = 0;

  void _increment() {
    _counter++;
  }

  void _decrement() {
    _counter--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState Counter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $_counter'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SUB
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  },
                  child: const Text('Decrement'),
                ),
                const SizedBox(height: 10.0),
                //ADD
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
