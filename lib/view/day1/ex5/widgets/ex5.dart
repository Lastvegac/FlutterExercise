import 'package:flutter/material.dart';
import 'package:flutter_part_1/utils/size_config.dart';

const url =
    'https://hips.hearstapps.com/wdy.h-cdn.co/assets/17/39/1506709524-cola-0247.jpg?crop=1.00xw:0.750xh;0,0.214xh&resize=1200:*';
const urlDod =
    'https://cdn.pixabay.com/photo/2019/08/19/07/45/dog-4415649__340.jpg';

class Example5 extends StatefulWidget {
  @override
  _Example5 createState() => _Example5();
}

class _Example5 extends State<Example5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Column(
          children: [
            Image(
              image: const NetworkImage(url),
              width: SizeConfig.screenWidth,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Image(
              image: const NetworkImage(urlDod),
              width: SizeConfig.screenWidth,
              height: 200,
              fit: BoxFit.scaleDown,
            )
          ],
        ),
      ),
    );
  }
}
