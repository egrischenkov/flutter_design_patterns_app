/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
