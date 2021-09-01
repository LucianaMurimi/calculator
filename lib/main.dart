import 'package:flutter/material.dart';
import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: new ThemeData(primaryColor: Colors.grey[900]),
      debugShowCheckedModeBanner: false,
      home: Controller(),
    );
  }
}
