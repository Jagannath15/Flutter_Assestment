import 'package:flutter/material.dart';
import 'package:phaino_assignment/Constants/constants.dart';
import 'package:phaino_assignment/Views/StartPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor:secondary),
        useMaterial3: true,
      ),
      home: StartPage()
    );
  }
}

