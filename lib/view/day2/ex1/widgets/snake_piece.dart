import 'package:flutter/widgets.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/game_constants.dart';

class SnakePiece extends StatelessWidget {
  const SnakePiece({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: PIECE_SIZE,
      height: PIECE_SIZE,
      decoration: BoxDecoration(
        color: const Color(0xFF0080FF),
        border: Border.all(color: const Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.circular(PIECE_SIZE),
      ),
    );
  }
}
