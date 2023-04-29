import 'dart:ui';

import 'package:flame/palette.dart';

class Styles {
  static Paint white = BasicPalette.white.paint();
  static Paint blue = BasicPalette.blue.paint();
  static Paint red = BasicPalette.red.paint();
  static Paint grass1 = const PaletteEntry(Color(0xFFa2d149)).paint();
  static Paint grass2 = const PaletteEntry(Color(0xFFaad751)).paint();

  static Paint snakeBody = BasicPalette.black.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  static Paint gameOver = BasicPalette.red.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;

  static Paint grass3 = const PaletteEntry(Color(0xFF578a34)).paint();
}
