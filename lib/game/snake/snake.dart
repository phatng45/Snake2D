import 'dart:collection';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:snake_2d/game/snake/snake_body_part.dart';

import '../component/cell.dart';

enum Direction { up, right, down, left }

class Snake {
  final LinkedList<SnakeBodyPart> snakeBody = LinkedList();

  Direction direction = Direction.right;
  Cell head = Cell.zero;
  Cell firstBody = Cell.zero;

  void move(Cell nextCell) {
    snakeBody.last.cell.cellType = CellType.empty;
    snakeBody.remove(snakeBody.last);
    grow(nextCell);
    // _updateTail(); // BUG
  }

  void grow(Cell nextCell) {
    snakeBody.addFirst(SnakeBodyPart.fromCell(nextCell, head, firstBody));
    firstBody = head;
    head = nextCell;
  }

  bool checkCrash(Cell nextCell) {
    for (var part in snakeBody) {
      if (part.cell == nextCell) {
        return true;
      }
    }

    return false;
  }

  void setHead(Cell cell) {
    head = cell;
    cell.cellType = CellType.snakeHeadRight;
    snakeBody.add(SnakeBodyPart(cell));
  }

  void setFirstBody(Cell cell) {
    firstBody = cell;
    cell.cellType = CellType.snakeBodyHorizontal;
    snakeBody.add(SnakeBodyPart(cell));
  }

  bool isHorizontal() =>
      direction == Direction.left || direction == Direction.right;

  Vector2 displacementToHead(Vector2 reference) {
    return reference - head.location;
  }

  void addCell(Cell next, Cell current, Cell previous) {
    snakeBody.add(SnakeBodyPart.fromCell(next, current, previous));
  }

  // ignore: unused_element
  void _updateTail() {
    var previousLastCellType = snakeBody.last.previous?.cell.cellType;
    var tail = snakeBody.last.cell;

    switch (previousLastCellType) {
      case CellType.snakeHeadLeft:
      case CellType.snakeBodyBottomRight:
        if (head.cellType == CellType.snakeHeadDown) {
          tail.cellType = CellType.snakeTailRight;
        } else {
          tail.cellType = CellType.snakeTailDown;
        }
        // tail.cellType = CellType.snakeTailRight;
        break;

      case CellType.snakeHeadRight:
      case CellType.snakeBodyTopLeft:
        if (head.cellType == CellType.snakeHeadUp) {
          tail.cellType = CellType.snakeTailLeft;
        } else {
          tail.cellType = CellType.snakeTailUp;
        }
        // tail.cellType = CellType.snakeTailLeft;
        break;

      case CellType.snakeBodyBottomLeft:
      case CellType.snakeHeadUp:
        if (head.cellType == CellType.snakeHeadLeft) {
          tail.cellType = CellType.snakeTailDown;
        } else {
          tail.cellType = CellType.snakeTailLeft;
        }
        // tail.cellType = CellType.snakeTailDown;
        break;

      case CellType.snakeHeadDown:
      case CellType.snakeBodyTopRight:
        if (head.cellType == CellType.snakeHeadRight) {
          tail.cellType = CellType.snakeTailUp;
        } else {
          tail.cellType = CellType.snakeTailRight;
        }
        // tail.cellType = CellType.snakeTailUp;
        break;

      case CellType.snakeBodyVertical:
        if (head.cellType == CellType.snakeHeadUp) {
          tail.cellType = CellType.snakeTailDown;
        } else {
          tail.cellType = CellType.snakeTailUp;
        }
        break;

      case CellType.snakeBodyHorizontal:
        if (head.cellType == CellType.snakeHeadLeft) {
          tail.cellType = CellType.snakeTailRight;
        } else {
          tail.cellType = CellType.snakeTailLeft;
        }
        break;

      case CellType.empty:
      case CellType.apple:
      case CellType.snakeTailLeft:
      case CellType.snakeTailRight:
      case CellType.snakeTailUp:
      case CellType.snakeTailDown:
      case null:
        break;
    }
  }
}
