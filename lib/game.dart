import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import 'objects/snake.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  static final Vector2 playerInitialPosition = WorldPos(6, 8);

  static Vector2 WorldPos(int x, int y) {
    return Vector2(x * 32, y * 32);
  }

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      map: WorldMapByTiled(
        "map/map.json",
        forceTileSize: Vector2(32, 32),
      ),
      // objectsBuilder: {
      //   "ghost_red": (properties) => Game.redGhost,
      //   "ghost_yellow": (properties) => Game.yellowGhost,
      //   "pixel": (properties) => Pixel.withSprite(properties.position, properties.size),
      //   "big_pixel":(properties) => BigPixel.withSprite(properties.position, properties.size),
      //   "fruit":(properties) => Fruit.withSprite(properties.position, properties.size),
      // }
      player: Snake(Game.playerInitialPosition, Vector2(32, 32)),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        setZoomLimitToFitMap: true,
      ),
      // overlayBuilderMap: {
      //   MyGameInterface.overlayKey : (context, game)
      //   {
      //     return MyGameInterface(game: game);
      //   }
      // },
      // initialActiveOverlays: const
      // [
      //   MyGameInterface.overlayKey
      // ],
      // components: [
      //   MyGameController()
      // ],
      // cameraConfig: CameraConfig(
      //     moveOnlyMapArea: true
      // ),
    );
  }
}
