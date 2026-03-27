import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeQuest',
      home: Scaffold(
        appBar: AppBar(title: Text('CodeQuest Flutter App')),
        body: Center(child: Text('Welcome to CodeQuest!')),
      ),
    );
  }
}
JokesScreen() // or add as a tab in TabBar
