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

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shape_factory.dart';
import '../shape_flyweight_factory.dart';
import '../shape_type.dart';
import '../shapes/i_positioned_shape.dart';
import 'positioned_shape_wrapper.dart';

class FlyweightPatternWidget extends StatefulWidget {
  @override
  _FlyweightPatternWidgetState createState() => _FlyweightPatternWidgetState();
}

class _FlyweightPatternWidgetState extends State<FlyweightPatternWidget> {
  final int shapesCount = 400;

  final ShapeFactory _shapeFactory = ShapeFactory();
  late ShapeFlyweightFactory _shapeFlyweightFactory;

  // ignore: prefer_final_fields
  List<IPositionedShape> _shapesList = [];

  int _shapeInstancesCount = 0;
  bool _useFlyweightFactory = false;

  ShapeType _getRandomShapeType() {
    var shapeTypeValues = ShapeType.values;
    return shapeTypeValues[Random().nextInt(shapeTypeValues.length)];
  }

  void _buildShapesList() {
    var shapeInstancesCount = 0;

    for (var i = 0; i < shapesCount; i++) {
      var shapeType = _getRandomShapeType();
      var shape = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShape(shapeType)
          : _shapeFactory.createShape(shapeType);

      shapeInstancesCount++;
      _shapesList.add(shape);
    }

    setState(() {
      _shapeInstancesCount = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShapeInstancesCount()
          : shapeInstancesCount;
    });
  }

  void _toggleUseFlyweightFactory(bool value) {
    setState(() {
      _useFlyweightFactory = value;
    });

    _buildShapesList();
  }

  @override
  void initState() {
    super.initState();
    _shapeFlyweightFactory = ShapeFlyweightFactory(shapeFactory: _shapeFactory);
    _buildShapesList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          title: Text(
            'Use Flyweight factory',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: _toggleUseFlyweightFactory,
          value: _useFlyweightFactory,
          activeColor: Colors.black,
        ),
        Expanded(
          child: Stack(
            children: [
              for (var shape in _shapesList)
                PositionedShapeWrapper(
                  shape: shape,
                ),
              Center(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Shape instances count: $_shapeInstancesCount',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
