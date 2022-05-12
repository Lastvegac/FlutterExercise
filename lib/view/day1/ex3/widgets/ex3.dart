import 'package:flutter/material.dart';

class Example3 extends StatefulWidget {
  @override
  _Example3 createState() => _Example3();
}

class _Example3 extends State<Example3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Bello',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              '1995',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
