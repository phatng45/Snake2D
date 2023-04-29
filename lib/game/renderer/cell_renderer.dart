import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:snake_2d/resources/game_sprites.dart';

import '../component/cell.dart';

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

    final cellActualSize = cellSize * (cellType == CellType.apple ? 1.3 : 1.1);
    final cellVector = Vector2(cellActualSize, cellActualSize);

    cellTypeToSprite?[cellType]?.render(canvas,
        position: location, size: cellVector, anchor: Anchor.topLeft);
  }
}
