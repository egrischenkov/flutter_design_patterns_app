import 'dart:math' show Random;
import 'dart:ui';

import 'package:flutter/material.dart';

import 'shape.dart';

class Circle extends Shape {
  late double radius;

  Circle(Color color, this.radius) : super(color);

  Circle.initial() : super(Colors.black) {
    radius = 50;
  }

  Circle.clone(Circle source) : super.clone(source) {
    radius = source.radius;
  }

  @override
  Shape clone() {
    return Circle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
    radius = Random().nextInt(50) + 25;
  }

  @override
  Widget render() {
    var diameter = 2 * radius;
    return SizedBox(
      height: 120,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: diameter,
          width: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(Icons.star, color: Colors.white),
        ),
      ),
    );
  }
}
