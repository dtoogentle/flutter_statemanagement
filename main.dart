import 'package:flutter/material.dart';
import 'package:fstatemgttutorial/provider/first_example/first_provider_example.dart';
import 'package:fstatemgttutorial/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter State Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        //home: const SetStateCounter(),
       // home: const SetStateDataInput(),
      // home: const SetStateList(),
      home: const FirstProviderExample(),
      ),
    );
  }
}
