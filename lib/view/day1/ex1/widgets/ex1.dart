import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  @override
  _Example1 createState() => _Example1();
}

class _Example1 extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Text(
        'Bello',
        style: TextStyle(
          fontSize: 30,
          color: Colors.red,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
