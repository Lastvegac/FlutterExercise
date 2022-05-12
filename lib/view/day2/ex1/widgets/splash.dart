import 'package:flutter/widgets.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/game_constants.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      width: BOARD_SIZE,
      height: BOARD_SIZE,
      padding: const EdgeInsets.all(TEXT_PADDING),
      child: const Center(
        child: Text("Tap to start the Game!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF50C878))),
      ),
    );
  }
}
