import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  @override
  _Example2 createState() => _Example2();
}

class _Example2 extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          'Bello',
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
