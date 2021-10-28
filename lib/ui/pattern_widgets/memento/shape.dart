import 'package:flutter/material.dart';

class Shape {
  late Color color;
  late double width;
  late double height;

  Shape({required this.color, required this.width, required this.height});

  Shape.initial() {
    color = Colors.black;
    width = 150.0;
    height = 150.0;
  }

  Shape.copy(Shape shape)
      : this(
          color: shape.color,
          width: shape.width,
          height: shape.height,
        );
}
