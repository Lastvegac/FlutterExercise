import 'package:flutter/material.dart';

class Example4 extends StatefulWidget {
  @override
  _Example4 createState() => _Example4();
}

class _Example4 extends State<Example4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bello',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '1995',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("Press me");
                },
                child: const Text("Press me"))
          ],
        ),
      ),
    );
  }
}
