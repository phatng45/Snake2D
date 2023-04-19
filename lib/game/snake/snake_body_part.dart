import 'dart:collection';

import '../component/cell.dart';

class SnakeBodyPart extends LinkedListEntry<SnakeBodyPart> {
  Cell cell;

  SnakeBodyPart(this.cell);

  factory SnakeBodyPart.fromCell(Cell next, Cell current, Cell previous) {
    double nx = next.location.x;
    double ny = next.location.y;
    double cx = current.location.x;
    double cy = current.location.y;
    double px = previous.location.x;
    double py = previous.location.y;

    if (nx == cx && ny > cy) {
      next.cellType = CellType.snakeHeadDown;
      current.cellType = CellType.snakeBodyVertical;
    } else if (nx == cx && ny < cy) {
      next.cellType = CellType.snakeHeadUp;
      current.cellType = CellType.snakeBodyVertical;
    } else if (nx > cx && ny == cy) {
      next.cellType = CellType.snakeHeadRight;
      current.cellType = CellType.snakeBodyHorizontal;
    } else if (nx < cx && ny == cy) {
      next.cellType = CellType.snakeHeadLeft;
      current.cellType = CellType.snakeBodyHorizontal;
    }

    if (nx > px && ny > py) {
      print(1);
      current.cellType = CellType.snakeBodyTopLeft;
    } else if (nx > px && ny < py) {      print(2);

    current.cellType = CellType.snakeBodyBottomLeft;
    } else if (nx < px && ny > py) {      print(3);

    current.cellType = CellType.snakeBodyTopRight;
    } else if (nx < px && ny < py) {      print(4);

    current.cellType = CellType.snakeBodyBottomRight;
    }

    return SnakeBodyPart(next);
  }
}
