
import 'dart:collection';

import 'package:flame/components.dart';
import 'package:snake_2d/game/snake/snake_body_part.dart';

import '../component/cell.dart';

enum Direction { up, right, down, left }

class Snake {

  final LinkedList<SnakeBodyPart> snakeBody = LinkedList();

  Direction direction = Direction.right;
  Cell head = Cell.zero;
  Cell firstBody = Cell.zero;

  void move(Cell nextCell) {
    _removeLast();
    grow(nextCell);
  }

  void grow(Cell nextCell) {
    _addFirst(nextCell, head, firstBody);
    head = nextCell;
    firstBody = head;
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
    _add(SnakeBodyPart(cell));

  }

  void setFirstBody (Cell cell){
    firstBody = cell;
    cell.cellType = CellType.snakeBodyHorizontal;
    _add(SnakeBodyPart(cell));
  }

  bool isHorizontal() {
    return direction == Direction.left || direction == Direction.right;
  }

  Vector2 displacementToHead(Vector2 reference) {
    return reference - head.location;
  }

  void addCell(Cell next, Cell current, Cell previous) {
    _add(SnakeBodyPart.fromCell(next, current, previous));
  }

  void _add(SnakeBodyPart part) {
    snakeBody.add(part);
  }

  void _addFirst(Cell cell, Cell pCell, Cell ppCell) {
    snakeBody.addFirst(SnakeBodyPart.fromCell(cell, pCell, ppCell));
  }

  void _removeLast() {
    snakeBody.last.cell.cellType = CellType.empty;
    snakeBody.remove(snakeBody.last);
  }
}