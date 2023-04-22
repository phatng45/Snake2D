import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'component/background.dart';
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

    // ignore: avoid_function_literals_in_foreach_calls
    grid.cells.forEach((rows) => rows.forEach((cell) => add(cell)));
    grid.generateFood();

    world = World(grid);
    add(world);

    return null;
  }

  @override
  void onTapUp(TapUpInfo info) {
    world.onTapUp(info);
  }
}
