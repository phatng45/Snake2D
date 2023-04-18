import 'package:bonfire/bonfire.dart';

class GameSprites {
  static Future<Sprite> get apple => Sprite.load("images/fruit/apple.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeHeadDown => Sprite.load("images/snake/head_down.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyVertical =>
      Sprite.load("images/snake/body_vertical.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyTopLeft =>
      Sprite.load("images/snake/body_topleft.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));
}
