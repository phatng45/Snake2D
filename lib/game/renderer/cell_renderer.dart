import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:snake_2d/resources/game_sprites.dart';

import '../component/cell.dart';
import '../config/game_config.dart';

class CellRenderer {
  static Sprite? apple;
  static Sprite? snakeBody;
  static Sprite? snakeHeadLeft;
  static Sprite? snakeHeadRight;
  static Sprite? snakeHeadUp;
  static Sprite? snakeHeadDown;
  static Sprite? snakeTailLeft;
  static Sprite? snakeTailRight;
  static Sprite? snakeTailUp;
  static Sprite? snakeTailDown;
  static Sprite? snakeBodyTopLeft;
  static Sprite? snakeBodyTopRight;
  static Sprite? snakeBodyBottomLeft;
  static Sprite? snakeBodyBottomRight;
  static Sprite? snakeBodyVertical;
  static Sprite? snakeBodyHorizontal;

  static Map<CellType, Sprite?>? cellTypeToSprite;

  static void getSprite() {
    // GameSprites. snakeBody;
    GameSprites.apple.then((value) => apple = value);
    GameSprites.snakeHeadLeft.then((value) => snakeHeadLeft = value);
    GameSprites.snakeHeadRight.then((value) => snakeHeadRight = value);
    GameSprites.snakeHeadUp.then((value) => snakeHeadUp = value);
    GameSprites.snakeHeadDown.then((value) => snakeHeadDown = value);
    GameSprites.snakeTailLeft.then((value) => snakeTailLeft = value);
    GameSprites.snakeTailRight.then((value) => snakeTailRight = value);
    GameSprites.snakeTailUp.then((value) => snakeTailUp = value);
    GameSprites.snakeTailDown.then((value) => snakeTailDown = value);
    GameSprites.snakeBodyTopLeft.then((value) => snakeBodyTopLeft = value);
    GameSprites.snakeBodyTopRight.then((value) => snakeBodyTopRight = value);
    GameSprites.snakeBodyBottomLeft
        .then((value) => snakeBodyBottomLeft = value);
    GameSprites.snakeBodyBottomRight
        .then((value) => snakeBodyBottomRight = value);
    GameSprites.snakeBodyVertical.then((value) => snakeBodyVertical = value);
    GameSprites.snakeBodyHorizontal
        .then((value) {snakeBodyHorizontal = value;
        cellTypeToSprite = {
        CellType.apple: apple,
        CellType.snakeBody: snakeBodyTopRight,
        CellType.snakeHeadLeft: snakeHeadLeft,
        CellType.snakeHeadRight: snakeHeadRight,
        CellType.snakeHeadUp: snakeHeadUp,
        CellType.snakeHeadDown: snakeHeadDown,
        CellType.snakeTailLeft: snakeTailLeft,
        CellType.snakeTailRight: snakeTailRight,
        CellType.snakeTailUp: snakeTailUp,
        CellType.snakeTailDown: snakeTailDown,
        CellType.snakeBodyTopLeft: snakeBodyTopLeft,
        CellType.snakeBodyTopRight: snakeBodyTopRight,
        CellType.snakeBodyBottomLeft: snakeBodyBottomLeft,
        CellType.snakeBodyBottomRight: snakeBodyBottomRight,
        CellType.snakeBodyVertical: snakeBodyVertical,
        CellType.snakeBodyHorizontal: snakeBodyHorizontal,
        };}
        );


  }

  static void render(
      CellType cellType, Canvas canvas, Vector2? location, int cellSize) {
    if (cellType == CellType.empty) return;
    _render(cellTypeToSprite![cellType]!, canvas, location, cellSize);
    // switch (cellType) {
    //
    //
    //   case CellType.snakeBody:
    //     _render(snakeHeadLeft, canvas, location, cellSize);
    //     break;
    //   case CellType.apple:
    //     _render(apple, canvas, location, cellSize);
    //     break;
    //   case CellType.empty:
    //     break;
    // }
  }

  static void _render(Sprite sprite, Canvas canvas, location, cellSize) {
    sprite.render(canvas,
        position: location,
        size: Vector2(cellSize * 1.0, cellSize * 1.0),
        anchor: Anchor.topLeft);
  }

  static Offset findStart(Vector2 location, int cellSize) {
    return Offset(location.x + GameConfig.snakeLineThickness / 2,
        location.y + GameConfig.snakeLineThickness / 2);
  }

  static Offset findEnd(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize - GameConfig.snakeLineThickness / 2,
        location.y + cellSize - GameConfig.snakeLineThickness / 2);
  }

  static Offset findMiddle(Vector2 location, int cellSize) {
    return Offset(location.x + cellSize / 2, location.y + cellSize / 2);
  }

  static double findRadius(int cellSize) {
    return cellSize / 2 - GameConfig.foodRadius;
  }
}
