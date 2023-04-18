import 'package:bonfire/bonfire.dart';

class GameSprites {
  static Future<Sprite> get apple => Sprite.load("images/fruit/apple.png",
      srcPosition: Vector2(0, 0), srcSize: Vector2(40, 40));

  static Future<SpriteAnimation> get snakeHeadRight => SpriteAnimation.load(
      "snake/head_right.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeHeadUp => SpriteAnimation.load(
      "snake/head_up.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeHeadDown => SpriteAnimation.load(
      "snake/head_down.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeHeadLeft => SpriteAnimation.load(
      "snake/head_left.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeBodyVertical => SpriteAnimation.load(
      "snake/body_vertical.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeBodyHorizontal =>
      SpriteAnimation.load(
          "snake/body_horizontal.png",
          SpriteAnimationData.sequenced(
              amount: 1,
              stepTime: .2,
              textureSize: Vector2(40, 40),
              texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeBodyTL => SpriteAnimation.load(
      "snake/body_topleft.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeBodyTR => SpriteAnimation.load(
      "snake/body_topright.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeBodyBL => SpriteAnimation.load(
      "snake/body_bottomleft.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeBodyBR => SpriteAnimation.load(
      "snake/body_bottomright.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeTailRight => SpriteAnimation.load(
      "snake/tail_right.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeTailUp => SpriteAnimation.load(
      "snake/tail_up.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeTailDown => SpriteAnimation.load(
      "snake/tail_down.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));

  static Future<SpriteAnimation> get snakeTailLeft => SpriteAnimation.load(
      "snake/tail_left.png",
      SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: .2,
          textureSize: Vector2(40, 40),
          texturePosition: Vector2(0, 0)));
}
