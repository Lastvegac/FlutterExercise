import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class ItemCalculate {
  String title;
  Color color;
  ItemCalculate(this.title, this.color);
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<ItemCalculate> _items = [
      ItemCalculate('C', Colors.grey),
      ItemCalculate('<', Colors.grey),
      ItemCalculate('%', Colors.grey),
      ItemCalculate('+', Colors.orange),
      ItemCalculate('7', Colors.black12),
      ItemCalculate('8', Colors.black12),
      ItemCalculate('9', Colors.black12),
      ItemCalculate('*', Colors.orange),
      ItemCalculate('4', Colors.black12),
      ItemCalculate('5', Colors.black12),
      ItemCalculate('6', Colors.black12),
      ItemCalculate('-', Colors.orange),
      ItemCalculate('3', Colors.black12),
      ItemCalculate('2', Colors.black12),
      ItemCalculate('1', Colors.black12),
      ItemCalculate('+', Colors.orange),
    ];

    final List<ItemCalculate> bottom_items = [
      ItemCalculate('0', Colors.black12),
      ItemCalculate('.', Colors.black12),
      ItemCalculate('=', Colors.orange),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: screenWidth,
              height: 250,
              padding: const EdgeInsets.only(right: 10, bottom: 5),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 1.0))),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '123456',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
              )),
          Container(
            padding: const EdgeInsets.all(20),
            child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: _items
                    .map((item) => CircleWidget(
                          screenWidth: screenWidth,
                          item: item,
                        ))
                    .toList()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bottom_items
                    .map((item) => Chip(
                          screenWidth: screenWidth,
                          item: item,
                        ))
                    .toList()),
          )
        ],
      ),
    );
  }
}

class Chip extends StatelessWidget {
  const Chip({
    Key? key,
    required this.screenWidth,
    required this.item,
  }) : super(key: key);

  final double screenWidth;
  final ItemCalculate item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: (screenWidth - 60) / 3,
      decoration: BoxDecoration(
          color: item.color, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          item.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.screenWidth,
    required this.item,
  }) : super(key: key);

  final double screenWidth;
  final ItemCalculate item;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: item.color, shape: BoxShape.circle),
        height: (screenWidth - 100) / 4,
        width: (screenWidth - 100) / 4,
        child: Center(
          child: Text(
            item.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
