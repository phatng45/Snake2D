import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'fruit.dart';

class Snake extends SimplePlayer with ObjectCollision {
  MovementDirection _currentMovementDirection = MovementDirection.none;

  bool isPacmanDead = false;
  bool canMove = true;

  int _score = 0;

  int get score => _score;
  int lifeAsInt = 3;

  Snake(Vector2 position, Vector2 size)
      : super(speed: 60, position: position, size: size) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(size: Vector2(28, 28), align: Vector2(2, 2))
    ]));
  }

  @override
  void die() async {
    canMove = false;
    enableCollision(false);
    // final dieAnimation = await PacmanAnimations.playerDie;
    lifeAsInt--;
    // await animation?.playOnce(dieAnimation, onFinish: () {
    //   animation?.opacity = 0;
    //   idle();
    //   isVisible = false;
    //   isPacmanDead = true;
    //   _currentMovementDirection = MovementDirection.none;
    // });
  }

  void increaseScore(int score) {
    _score += score;
  }

  void _movePlayer() {
    if (!canMove) return;
    switch (_currentMovementDirection) {
      case MovementDirection.down:
        moveDown(speed);
        break;

      case MovementDirection.up:
        moveUp(speed);
        break;

      case MovementDirection.left:
        moveLeft(speed);
        break;

      case MovementDirection.right:
        moveRight(speed);
        break;

      default:
        idle();
        break;
    }
  }

  @override
  bool hasGesture() => true;

  @override
  bool handlerPointerMove(PointerMoveEvent event) {
    double quarterOfPi = pi / 4;
    double piMinusQuarter = pi - quarterOfPi;
    double angle = event.localDelta.direction;
    if (angle >= -piMinusQuarter && angle <= -quarterOfPi) {
      _currentMovementDirection = MovementDirection.up;
    } else if (angle >= quarterOfPi && angle <= piMinusQuarter) {
      _currentMovementDirection = MovementDirection.down;
    } else if ((angle >= piMinusQuarter && angle <= pi) ||
        (angle <= -piMinusQuarter && angle >= -pi)) {
      _currentMovementDirection = MovementDirection.left;
    } else if (angle >= -quarterOfPi && angle <= quarterOfPi) {
      _currentMovementDirection = MovementDirection.right;
    }

    return super.handlerPointerMove(event);
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Fruit) {
      Fruit fruit = component;
      _eat(fruit);
    }

    return super.onCollision(component, active);
  }

  void _eat(Fruit fruit) {}

  @override
  void update(double dt) {
    _movePlayer();
    super.update(dt);
  }
}

enum MovementDirection { none, idle, left, right, up, down }
