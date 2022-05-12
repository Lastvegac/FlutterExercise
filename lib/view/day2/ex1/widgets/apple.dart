import 'package:flutter/widgets.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/game_constants.dart';

class Apple extends StatelessWidget {
  const Apple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: PIECE_SIZE,
      height: PIECE_SIZE,
      decoration: BoxDecoration(
        color: const Color(0xFFFF0000),
        border: Border.all(color: const Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.circular(PIECE_SIZE),
      ),
    );
  }
}
