import 'package:flutter/material.dart';

import 'i_positioned_shape.dart';

class Square implements IPositionedShape {
  final Color color;
  final double width;

  Square({required this.color, required this.width});

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}