import 'package:bonfire/bonfire.dart';

class GameSprites {
  static Future<Sprite> get apple => Sprite.load("fruit/apple.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeHeadDown => Sprite.load("snake/head_down.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyVertical => Sprite.load("snake/body_vertical.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyTopLeft => Sprite.load("snake/body_topleft.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));
}
