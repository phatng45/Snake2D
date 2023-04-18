import 'package:bonfire/bonfire.dart';

import '../resources/sprite_sheet.dart';

class Fruit extends GameDecoration with Sensor {
  Fruit.withSprite(Vector2 position, Vector2 size)
      : super.withSprite(
          position: position,
          size: size,
          sprite: GameSprites.apple,
        );

  @override
  void onContact(GameComponent component) {}
}
