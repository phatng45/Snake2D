import 'package:flame/components.dart';

class GameSprites {
  static Future<Sprite> get apple => _loadSprite("fruit/apple");

  static Future<Sprite> get snakeHeadDown => _loadSprite("snake/head_down");

  static Future<Sprite> get snakeHeadLeft => _loadSprite("snake/head_left");

  static Future<Sprite> get snakeHeadRight => _loadSprite("snake/head_right");

  static Future<Sprite> get snakeHeadUp => _loadSprite("snake/head_up");

  static Future<Sprite> get snakeBodyHorizontal =>
      _loadSprite("snake/body_horizontal");

  static Future<Sprite> get snakeBodyVertical =>
      _loadSprite("snake/body_vertical");

  static Future<Sprite> get snakeBodyTopLeft =>
      _loadSprite("snake/body_topleft");

  static Future<Sprite> get snakeBodyTopRight =>
      _loadSprite("snake/body_topright");

  static Future<Sprite> get snakeBodyBottomLeft =>
      _loadSprite("snake/body_bottomleft");

  static Future<Sprite> get snakeBodyBottomRight =>
      _loadSprite("snake/body_bottomright");

  static Future<Sprite> get snakeTailDown => _loadSprite("snake/tail_down");

  static Future<Sprite> get snakeTailLeft => _loadSprite("snake/tail_left");

  static Future<Sprite> get snakeTailRight => _loadSprite("snake/tail_right");

  static Future<Sprite> get snakeTailUp => _loadSprite("snake/tail_up");

  static Future<Sprite> _loadSprite(String name) async =>
      Sprite.load("$name.png",
          srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));
}
