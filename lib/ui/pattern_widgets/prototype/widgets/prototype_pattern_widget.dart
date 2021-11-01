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
