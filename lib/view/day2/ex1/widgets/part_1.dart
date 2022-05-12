// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

const txtButtonStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 30,
);

class Part1 extends StatefulWidget {
  const Part1({Key? key}) : super(key: key);

  @override
  _Part1 createState() => _Part1();
}

class _Part1 extends State<Part1> {
  bool _isScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isScreen ? Colors.green : Colors.red,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  setState(() {
                    _isScreen = !_isScreen;
                  });
                },
                child: Text(_isScreen ? 'TURN RED' : 'TURN GREEN',
                    style: txtButtonStyle))
          ],
        ),
      ),
    );
  }
}
