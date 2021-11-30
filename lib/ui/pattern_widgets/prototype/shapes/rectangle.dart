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