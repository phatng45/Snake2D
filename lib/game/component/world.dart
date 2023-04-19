import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/input.dart';

import '../config/game_config.dart';
import '../config/styles.dart';
import '../snake/grid.dart';
import '../snake/snake.dart';
import '../snake_game.dart';
import '../system/command_queue.dart';
import 'cell.dart';
import 'dynamic_fps_position_component.dart';

class World extends DynamicFpsPositionComponent with HasGameRef<SnakeGame> {
  final Grid _grid;
  final Snake _snake = Snake();
  final CommandQueue _commandQueue = CommandQueue();

  bool gameOver = false;

  World(this._grid) : super(GameConfig.fps) {
    _initializeSnake();
  }

  @override
  void updateDynamic(double dt) {
    if (!gameOver) {
      _commandQueue.evaluateNextInput(_snake);

      var nextCell = _getNextCell();

      if (nextCell == Grid.border) {
        gameOver = true;
        return;
      }

      if (_snake.checkCrash(nextCell)) {
        gameOver = true;
        return;
      }

      if (nextCell.cellType != CellType.apple) {
        _snake.move(nextCell);
        return;
      }

      _snake.grow(nextCell);
      _grid.generateFood();
    }
  }

  @override
  void render(Canvas canvas) {
    if (gameOver) {
      canvas.drawRect(
          Rect.fromLTRB(
              2, 2, gameRef.canvasSize.x - 2, gameRef.canvasSize.y - 2),
          Styles.gameOver);
    }
  }

  void onTapUp(TapUpInfo info) {
    final touchPoint = info.eventPosition.game;
    _commandQueue.add(touchPoint);
  }

  void _initializeSnake() {
    var headIndex = GameConfig.headIndex;
    var snakeLength = GameConfig.initialSnakeLength;
    var head = _grid.findCell(headIndex.x.toInt(), headIndex.y.toInt());
    var firstBody =
        _grid.findCell(headIndex.x.toInt() - 1, headIndex.y.toInt());
    var tail = _grid.findCell(headIndex.x.toInt() - 2, headIndex.y.toInt());
    _snake.setHead(head);
    _snake.setFirstBody(firstBody);
    _snake.addCell(head, firstBody, tail);
  }

  //TODO use vector addition instead of a switch
  Cell _getNextCell() {
    var row = _snake.head.row;
    var column = _snake.head.column;

    switch (_snake.direction) {
      case Direction.up:
        row--;
        break;
      case Direction.right:
        column++;
        break;
      case Direction.down:
        row++;
        break;
      case Direction.left:
        column--;
        break;
    }
    return _grid.findCell(column, row);
  }
}
