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

      if(cx > px){
        current.cellType = CellType.snakeBodyBottomLeft;
      }else if(cx< px){
        current.cellType = CellType.snakeBodyBottomRight;
      }else{
        current.cellType = CellType.snakeBodyVertical;
      }


    } else if (nx == cx && ny < cy) {
      next.cellType = CellType.snakeHeadUp;

      if(cx > px){
        current.cellType = CellType.snakeBodyTopLeft;
      }else if(cx< px){
        current.cellType = CellType.snakeBodyTopRight;
      }else{
        current.cellType = CellType.snakeBodyVertical;
      }

    } else if (nx > cx && ny == cy) {
      next.cellType = CellType.snakeHeadRight;

      if(cy > py){
        current.cellType = CellType.snakeBodyTopRight;
      }else if(cy< py){
        current.cellType = CellType.snakeBodyBottomRight;
      }else{
        current.cellType = CellType.snakeBodyHorizontal;

      }

    } else if (nx < cx && ny == cy) {
      next.cellType = CellType.snakeHeadLeft;

      if(cy > py){
        current.cellType = CellType.snakeBodyTopLeft;
      }else if(cy< py){
        current.cellType = CellType.snakeBodyBottomLeft;
      }else{
        current.cellType = CellType.snakeBodyHorizontal;

      }
    }


    return SnakeBodyPart(next);
  }
}
