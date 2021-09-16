import 'dart:math' show Random;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shape.dart';

class Rectangle extends Shape {
  late double width;
  late double height;

  Rectangle(Color color, this.width, this.height) : super(color);

  Rectangle.initial() : super(Colors.black) {
    width = 100;
    height = 100;
  }

  Rectangle.clone(Rectangle source) : super.clone(source) {
    width = source.width;
    height = source.width;
  }

  @override
  Shape clone() {
    return Rectangle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
    height = (Random().nextInt(100) + 50).toDouble();
    width = (Random().nextInt(100) + 50).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
          child: Icon(Icons.star, color: Colors.white),
        ),
      ),
    );
  }
}