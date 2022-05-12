import 'package:flutter/material.dart';
import 'package:flutter_part_1/view/day3/ex1/components/Display.dart';
import 'package:flutter_part_1/view/day3/ex1/components/Keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints.expand(
            width: 500,
            height: 750,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: const [Display(), Keyboard()],
          ),
        ),
      ),
    );
  }
}
