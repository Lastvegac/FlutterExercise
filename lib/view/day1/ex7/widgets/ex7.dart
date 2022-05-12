import 'package:flutter/material.dart';
import 'package:flutter_part_1/utils/size_config.dart';

const avatar =
    'https://petkingdomspa.com/wp-content/uploads/2021/01/CAT-LONG-CHO-CHO.jpg';

const url =
    'https://i.pinimg.com/originals/7b/39/48/7b3948951de447e7000fdee71215463c.jpg';

const category = "Mike Katz";
const title = 'Smoothies Connoisseur';
const desciption = 'Smoothies';
const chef = 'Recipe';

const stylesCategory =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20);

const styleTitle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16);

const styleDescription =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);

const styleNameChef =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);

class Example7 extends StatefulWidget {
  const Example7({Key? key}) : super(key: key);

  @override
  _Example7 createState() => _Example7();
}

class _Example7 extends State<Example7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
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
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Colors.white,
                      ),
                      image: const DecorationImage(image: NetworkImage(avatar)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
                const Icon(Icons.heart_broken_rounded),
              ],
            ),
            const Positioned(
              child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(desciption, style: styleDescription)),
              bottom: 100,
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
