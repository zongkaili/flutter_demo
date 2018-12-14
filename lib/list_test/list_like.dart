import 'package:flutter/material.dart';
import 'package:flutter_demo/list_test//random.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.grey,
      ),
      home: new RandomWords(),
    );
  }
}