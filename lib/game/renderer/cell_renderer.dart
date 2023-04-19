import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:snake_2d/resources/game_sprites.dart';

import '../component/cell.dart';
import '../config/game_config.dart';

class CellRenderer {
  static Map<CellType, Sprite?>? cellTypeToSprite;

  static void getSprite() async {
    cellTypeToSprite = {
      CellType.apple: await GameSprites.apple,
      CellType.snakeHeadLeft: await GameSprites.snakeHeadLeft,
      CellType.snakeHeadRight: await GameSprites.snakeHeadRight,
      CellType.snakeHeadUp: await GameSprites.snakeHeadUp,
      CellType.snakeHeadDown: await GameSprites.snakeHeadDown,
      CellType.snakeTailLeft: await GameSprites.snakeTailLeft,
      CellType.snakeTailRight: await GameSprites.snakeTailRight,
      CellType.snakeTailUp: await GameSprites.snakeTailUp,
      CellType.snakeTailDown: await GameSprites.snakeTailDown,
      CellType.snakeBodyTopLeft: await GameSprites.snakeBodyTopLeft,
      CellType.snakeBodyTopRight: await GameSprites.snakeBodyTopRight,
      CellType.snakeBodyBottomLeft: await GameSprites.snakeBodyBottomLeft,
      CellType.snakeBodyBottomRight: await GameSprites.snakeBodyBottomRight,
      CellType.snakeBodyVertical: await GameSprites.snakeBodyVertical,
      CellType.snakeBodyHorizontal: await GameSprites.snakeBodyHorizontal,
    };
  }

  static void render(
      CellType cellType, Canvas canvas, Vector2? location, int cellSize) {
    if (cellType == CellType.empty) return;

    _render(cellType, canvas, location, cellSize);
  }

  static void _render(CellType cellType, Canvas canvas, location, cellSize) {
    cellTypeToSprite![cellType]!.render(canvas,
        position: location,
        size: cellType == CellType.apple
            ? Vector2(cellSize * 1.3, cellSize * 1.3)
            : Vector2(cellSize * 1.1, cellSize * 1.1),
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
