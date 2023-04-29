import 'dart:ui';

import 'package:flame/components.dart';

import '../renderer/cell_renderer.dart';
import '../snake_game.dart';

enum CellType {
  empty,
  apple,
  snakeHeadLeft,
  snakeHeadRight,
  snakeHeadUp,
  snakeHeadDown,
  snakeTailLeft,
  snakeTailRight,
  snakeTailUp,
  snakeTailDown,
  snakeBodyTopLeft,
  snakeBodyTopRight,
  snakeBodyBottomLeft,
  snakeBodyBottomRight,
  snakeBodyVertical,
  snakeBodyHorizontal
}

class Cell extends PositionComponent with HasGameRef<SnakeGame> {
  static Cell zero = Cell(Vector2(0, 0), 0);

  final Vector2 _index;
  final int _cellSize;
  CellType cellType;
  Vector2 _location = Vector2.zero();

  int get row => _index.x.toInt();

  int get column => _index.y.toInt();

  Vector2 get index => _index;

  Vector2 get location => _location;

  Cell(this._index, this._cellSize, {this.cellType = CellType.empty});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    Vector2 start = gameRef.offSets.start;
    _location =
        Vector2(column * _cellSize + start.x, row * _cellSize + start.y);

    CellRenderer.getSprite();
  }

  @override
  void render(Canvas canvas) {
    CellRenderer.render(cellType, canvas, _location, _cellSize);
  }
}
