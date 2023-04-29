import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'component/background.dart';
import 'component/cell.dart';
import 'component/world.dart';
import 'config/game_config.dart';
import 'snake/grid.dart';
import 'snake/offsets.dart';

class SnakeGame extends FlameGame with TapDetector {
  Grid grid = Grid(GameConfig.rows, GameConfig.columns, GameConfig.cellSize);
  late World world;
  Offsets offSets = Offsets(Vector2.zero());

  @override
  Future<void> onLoad() async {
    super.onLoad();

    offSets = Offsets(canvasSize);

    add(BackGround(GameConfig.cellSize));

    for (List<Cell> rows in grid.cells) {
      for (Cell cell in rows) {
        add(cell);
      }
    }
    grid.generateFood();

    world = World(grid);
    add(world);

    return;
  }

  @override
  void onTapUp(TapUpInfo info) => world.onTapUp(info);
}
