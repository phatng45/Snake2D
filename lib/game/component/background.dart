import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:snake_2d/game/config/game_config.dart';

import '../../resources/game_sprites.dart';
import '../config/styles.dart';
import '../snake_game.dart';

class BackGround extends PositionComponent with HasGameRef<SnakeGame> {
  Offset start = Offset.zero;
  Offset end = Offset.zero;

  final int cellSize;

  BackGround(this.cellSize);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    start = gameRef.offSets.start.toOffset();
    end = gameRef.offSets.end.toOffset();
  }

  @override
  void render(Canvas canvas) {
    _drawGrid(canvas);
    _drawVerticalLines(canvas);
    _drawHorizontalLines(canvas);
  }

  void _drawVerticalLines(Canvas c) {
    for (double x = start.dx; x <= end.dx; x += cellSize) {
      c.drawLine(Offset(x, start.dy), Offset(x, end.dy), Styles.grass2);
    }
  }

  void _drawHorizontalLines(Canvas c) {
    for (double y = start.dy; y <= end.dy; y += cellSize) {
      c.drawLine(Offset(start.dx, y), Offset(end.dx, y), Styles.grass2);
    }
  }

  void _drawGrid(Canvas c) {
    c.drawRect(Rect.fromPoints(start, end), Styles.grass1);
    for (double x = 0; x <= GameConfig.rows; x++) {
      for (double y = 0; y <= GameConfig.columns; y++) {
        c.drawRect(
            Rect.fromPoints(Offset(y * cellSize, x * cellSize),
                Offset(y * cellSize + cellSize, x * cellSize + cellSize)),
            (x + y) % 2 == 0 ? Styles.grass1 : Styles.grass2);
      }
    }
  }
}
