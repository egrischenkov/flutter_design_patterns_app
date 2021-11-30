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

import 'package:flutter/material.dart';

import '../../../widgets/vertical_space.dart';
import '../shapes/circle.dart';
import '../shapes/rectangle.dart';
import '../shapes/shape.dart';
import 'shape_column.dart';

class PrototypePatternWidget extends StatefulWidget {
  @override
  _PrototypePatternWidgetState createState() => _PrototypePatternWidgetState();
}

class _PrototypePatternWidgetState extends State<PrototypePatternWidget> {
  final Shape _circle = Circle.initial();
  final Shape _rectangle = Rectangle.initial();

  Shape? _circleClone;
  Shape? _rectangleClone;

  void _randomiseCircleProperties() {
    setState(_circle.randomiseProperties);
  }

  void _cloneCircle() {
    setState(() {
      _circleClone = _circle.clone();
    });
  }

  void _randomiseRectangleProperties() {
    setState(_rectangle.randomiseProperties);
  }

  void _cloneRectangle() {
    setState(() {
      _rectangleClone = _rectangle.clone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ShapeColumn(
            shape: _circle,
            shapeClone: _circleClone,
            onClonePressed: _cloneCircle,
            onRandomisePropertiesPressed: _randomiseCircleProperties,
          ),
          VerticalSpace(64),
          ShapeColumn(
            shape: _rectangle,
            shapeClone: _rectangleClone,
            onRandomisePropertiesPressed: _randomiseRectangleProperties,
            onClonePressed: _cloneRectangle,
          ),
        ],
      ),
    );
  }
}
