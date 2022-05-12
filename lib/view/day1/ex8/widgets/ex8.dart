import 'package:flutter/material.dart';
import 'package:flutter_part_1/utils/size_config.dart';

const url =
    'https://i.pinimg.com/originals/99/f9/ed/99f9ede31328c8484e9e252d08811535.jpg';
const icNote =
    'https://hips.hearstapps.com/hmg-prod/images/best-small-dog-breeds-pug-1598986985.jpg?crop=0.444xw:1.00xh;0.371xw,0&resize=480:*';
const txtTitleStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20);

const txtChipTitle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);

class Example8 extends StatefulWidget {
  const Example8({Key? key}) : super(key: key);

  @override
  _Example8 createState() => _Example8();
}

class _Example8 extends State<Example8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Fooderlich'),
      ),
      body: Container(
        color: Colors.black54,
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
        constraints: BoxConstraints.expand(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            image: const DecorationImage(
                image: NetworkImage(url), fit: BoxFit.cover),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(icNote),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 80,
                    width: 50,
                  ),
                  const Text("Recipe Trends", style: txtTitleStyle),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: const EdgeInsets.all(5.0),
                        label: const Text(
                          'Healthy',
                          style: txtChipTitle,
                        ),
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.cancel),
                        deleteIconColor: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: const EdgeInsets.all(5.0),
                        label: const Text(
                          'Vegan',
                          style: txtChipTitle,
                        ),
                        onDeleted: () {},
                        deleteIcon: const Icon(Icons.cancel),
                        deleteIconColor: Colors.white,
                      ),
                      const SizedBox(width: 10),
                      const Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: EdgeInsets.all(5.0),
                        label: Text(
                          'Vegan',
                          style: txtChipTitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: EdgeInsets.all(5.0),
                        label: Text(
                          'Greens',
                          style: txtChipTitle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: EdgeInsets.all(5.0),
                        label: Text(
                          'Wheat',
                          style: txtChipTitle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: EdgeInsets.all(5.0),
                        label: Text(
                          'Pescetarian',
                          style: txtChipTitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: EdgeInsets.all(5.0),
                        label: Text(
                          'Mint',
                          style: txtChipTitle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Chip(
                        backgroundColor: Colors.black87,
                        labelPadding: EdgeInsets.all(5.0),
                        label: Text(
                          'Lemongrass',
                          style: txtChipTitle,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
