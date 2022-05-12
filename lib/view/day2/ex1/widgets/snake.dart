// ignore_for_file: deprecated_member_use, constant_identifier_names, avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/apple.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/game_constants.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/snake_piece.dart';
import 'package:flutter_part_1/view/day2/ex1/widgets/splash.dart';

const viewControll = TextStyle(fontSize: 18, color: Colors.white);
enum Direction { LEFT, RIGHT, UP, DOWN }
enum GameState { SPLASH, START, VICTORY, FAILURE, RUNNING }

var _snakePiecePositions;
Point _applePosition;
Timer timer;
Direction _direction = Direction.UP;
GameState _gameState = GameState.SPLASH;

class Snake extends StatefulWidget {
  const Snake({Key? key}) : super(key: key);

  @override
  _Snake createState() => _Snake();
}

class _Snake extends State<Snake> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 370,
          height: 370,
          padding: const EdgeInsets.all(29),
          decoration: const BoxDecoration(color: Colors.green),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapUp: (tabUpDetails) {
              _handleTap(tabUpDetails);
            },
            child: _getBoardChildBasedOnGameState(),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child:
                      const Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child:
                          const Icon(Icons.arrow_upward, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child:
                          const Icon(Icons.arrow_downward, color: Colors.white),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.arrow_forward_sharp,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

_getBoardChildBasedOnGameState() {
  var child;

  switch (_gameState) {
    case GameState.SPLASH:
      child = const Splash();
      break;

    case GameState.RUNNING:
      List<Positioned> snakePiecesAndApple = [];
      _snakePiecePositions.forEach((i) {
        snakePiecesAndApple.add(Positioned(
          child: const SnakePiece(),
          left: i.x * PIECE_SIZE,
          top: i.y * PIECE_SIZE,
        ));
      });

      final apple = Positioned(
        child: const Apple(),
        left: _applePosition.x * PIECE_SIZE,
        top: _applePosition.y * PIECE_SIZE,
      );

      snakePiecesAndApple.add(apple);

      child = Stack(children: snakePiecesAndApple);
      break;

    case GameState.VICTORY:
    // _timer.cancel();
    // child = Victory();
    // break;

    case GameState.FAILURE:
      // _timer.cancel();
      // child = Failure();
      break;
    case GameState.START:
      // TODO: Handle this case.
      break;
  }
  return child;
}

void _grow() {
  setState(() {
    _snakePiecePositions.insert(0, _getNewHeadPosition());
  });
}

Point _getNewHeadPosition() {
  var newHeadPos;

  switch (_direction) {
    case Direction.LEFT:
      var currentHeadPos = _snakePiecePositions.first;
      newHeadPos = Point(currentHeadPos.x - 1, currentHeadPos.y);
      break;

    case Direction.RIGHT:
      var currentHeadPos = _snakePiecePositions.first;
      newHeadPos = Point(currentHeadPos.x + 1, currentHeadPos.y);
      break;

    case Direction.UP:
      var currentHeadPos = _snakePiecePositions.first;
      newHeadPos = Point(currentHeadPos.x, currentHeadPos.y - 1);
      break;

    case Direction.DOWN:
      var currentHeadPos = _snakePiecePositions.first;
      newHeadPos = Point(currentHeadPos.x, currentHeadPos.y + 1);
      break;
  }

  return newHeadPos;
}

void _move() {
  setState(() {
    _snakePiecePositions.insert(0, _getNewHeadPosition());
    _snakePiecePositions.removeLast();
  });
}

bool _isAppleCollision() {
  if (_snakePiecePositions.first.x == _applePosition.x &&
      _snakePiecePositions.first.y == _applePosition.y) {
    return true;
  }

  return false;
}

bool _isWallCollision() {
  var currentHeadPos = _snakePiecePositions.first;

  if (currentHeadPos.x < 0 ||
      currentHeadPos.y < 0 ||
      currentHeadPos.x > BOARD_SIZE / PIECE_SIZE ||
      currentHeadPos.y > BOARD_SIZE / PIECE_SIZE) {
    return true;
  }

  return false;
}

bool _isBoardFilled() {
  const totalPiecesThatBoardCanFit =
      (BOARD_SIZE * BOARD_SIZE) / (PIECE_SIZE * PIECE_SIZE);
  if (_snakePiecePositions.length == totalPiecesThatBoardCanFit) {
    return true;
  }

  return false;
}

void _onTimerTick(Timer timer) {
  _move();

  if (_isWallCollision()) {
    _changeGameState(GameState.FAILURE);
    return;
  }

  if (_isAppleCollision()) {
    if (_isBoardFilled()) {
      _changeGameState(GameState.VICTORY);
    } else {
      _generateNewApple();
      _grow();
    }
    return;
  }
}

void _generateFirstSnakePosition() {
  setState(() {
    final midPoint = (BOARD_SIZE / PIECE_SIZE / 2);
    _snakePiecePositions = [
      Point(midPoint, midPoint - 2),
      Point(midPoint, midPoint - 1),
      Point(midPoint, midPoint),
      Point(midPoint, midPoint + 1),
      Point(midPoint, midPoint + 2),
    ];
  });
}

void _handleTap(TapUpDetails tapUpDetails) {
  switch (_gameState) {
    case GameState.SPLASH:
      _moveFromSplashToRunningState();
      break;
    case GameState.START:
      _changeDirectionBasedOnTap(tapUpDetails);
      break;
    case GameState.VICTORY:
      _changeGameState(GameState.SPLASH);
      break;
    case GameState.FAILURE:
      _changeGameState(GameState.SPLASH);
      break;
  }
}

void _moveFromSplashToRunningState() {
  _generateFirstSnakePosition();
  _generateNewApple();
  _direction = Direction.UP;
  _changeGameState(GameState.START);
  _timer = Timer.periodic(const Duration(milliseconds: 500), _onTimerTick);
}

void _changeDirectionBasedOnTap(TapUpDetails tapUpDetails) {
  RenderBox getBox = context.findRenderObject();
  var localPosition = getBox.globalToLocal(tapUpDetails.globalPosition);
  final x = (localPosition.dx / PIECE_SIZE).round();
  final y = (localPosition.dy / PIECE_SIZE).round();

  final currentHeadPos = _snakePiecePositions.first;

  switch (_direction) {
    case Direction.LEFT:
      if (y < currentHeadPos.y) {
        setState(() {
          _direction = Direction.UP;
        });
        return;
      }

      if (y > currentHeadPos.y) {
        setState(() {
          _direction = Direction.DOWN;
        });
        return;
      }
      break;

    case Direction.RIGHT:
      if (y < currentHeadPos.y) {
        setState(() {
          _direction = Direction.UP;
        });
        return;
      }

      if (y > currentHeadPos.y) {
        setState(() {
          _direction = Direction.DOWN;
        });
        return;
      }
      break;

    case Direction.UP:
      if (x < currentHeadPos.x) {
        setState(() {
          _direction = Direction.LEFT;
        });
        return;
      }

      if (x > currentHeadPos.x) {
        setState(() {
          _direction = Direction.RIGHT;
        });
        return;
      }
      break;

    case Direction.DOWN:
      if (x < currentHeadPos.x) {
        setState(() {
          _direction = Direction.LEFT;
        });
        return;
      }

      if (x > currentHeadPos.x) {
        setState(() {
          _direction = Direction.RIGHT;
        });
        return;
      }
      break;
  }
}

void _changeGameState(GameState gameState) {
  setState(() {
    _gameState = gameState;
  });
}

void _generateNewApple() {
  setState(() {
    Random rng = Random();
    var min = 0;
    var max = BOARD_SIZE ~/ PIECE_SIZE;
    var nextX = min + rng.nextInt(max - min);
    var nextY = min + rng.nextInt(max - min);

    var newApple = Point(nextX.toDouble(), nextY.toDouble());

    if (_snakePiecePositions.contains(newApple)) {
      _generateNewApple();
    } else {
      _applePosition = newApple;
    }
  });
}
