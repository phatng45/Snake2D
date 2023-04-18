import 'package:bonfire/bonfire.dart';

class GameSprites {
  static Future<Sprite> get apple => Sprite.load("images/fruit/apple.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeHeadDown =>
      Sprite.load("images/snake/head_down.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeHeadLeft =>
      Sprite.load("images/snake/head_left.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeHeadRight =>
      Sprite.load("images/snake/head_right.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeHeadUp =>
      Sprite.load("images/snake/head_up.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyHorizontal =>
      Sprite.load("images/snake/body_horizontal.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyVertical =>
      Sprite.load("images/snake/body_vertical.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyTopLeft =>
      Sprite.load("images/snake/body_topleft.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyTopRight =>
      Sprite.load("images/snake/body_topright.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyBottomLeft =>
      Sprite.load("images/snake/body_bottomleft.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeBodyBottomRight =>
      Sprite.load("images/snake/body_bottomright.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeTailDown =>
      Sprite.load("images/snake/tail_down.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeTailLeft =>
      Sprite.load("images/snake/tail_left.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeTailRight =>
      Sprite.load("images/snake/tail_right.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<Sprite> get snakeTailUp =>
      Sprite.load("images/snake/tail_up.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));
}
