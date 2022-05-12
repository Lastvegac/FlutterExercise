import 'package:flutter/material.dart';
import 'package:flutter_part_1/utils/size_config.dart';

const avatar =
    'https://i.pinimg.com/originals/7b/39/48/7b3948951de447e7000fdee71215463c.jpg';

const url =
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=640:*';

const category = "Editor's Choice";
const title = 'The Art of Dough';
const desciption = 'Learn to make the perfect bread';
const chef = 'Ray wenderlich';

const stylesCategory =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);

const styleTitle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24);

const styleDescription =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16);

const styleNameChef =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18);

class Example6 extends StatefulWidget {
  @override
  _Example6 createState() => _Example6();
}

class _Example6 extends State<Example6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints.expand(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          image: const DecorationImage(
              image: NetworkImage(url), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 120,
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        category,
                        style: stylesCategory,
                      ),
                      Text(
                        title,
                        style: styleTitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              child: Text(desciption, style: styleDescription),
              bottom: 35,
              right: 0,
            ),
            const Positioned(
              child: Text(
                chef,
                style: styleNameChef,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}
