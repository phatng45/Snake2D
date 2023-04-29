import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import '../config/game_config.dart';
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
  }

  double offsetX = 22;
  double offsetY = 7;

  void _drawGrid(Canvas c) {
    c.drawRect(Rect.fromPoints(start, end), Styles.grass3);
    for (double x = 0; x <= GameConfig.rows; x++) {
      for (double y = 0; y <= GameConfig.columns; y++) {
        c.drawRect(
            Rect.fromPoints(
                Offset(y * cellSize + offsetY, x * cellSize + offsetX),
                Offset(y * cellSize + cellSize + offsetY,
                    x * cellSize + cellSize + offsetX)),
            (x + y) % 2 == 0 ? Styles.grass1 : Styles.grass2);
      }
    }
  }
}
