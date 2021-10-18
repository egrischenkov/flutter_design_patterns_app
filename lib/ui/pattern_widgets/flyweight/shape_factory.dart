import 'package:flutter/material.dart';

import 'shape_type.dart';
import 'shapes/circle.dart';
import 'shapes/i_positioned_shape.dart';
import 'shapes/square.dart';

class ShapeFactory {
  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return Circle(
          color: Colors.red.withOpacity(0.2),
          diameter: 10,
        );
      case ShapeType.Square:
        return Square(
          color: Colors.blue.withOpacity(0.2),
          width: 10,
        );
      default:
        throw Exception("Shape type '$shapeType' is not supported");
    }
  }
}
