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
import '../../../widgets/common_elevated_button.dart';

import '../../../widgets/horizontal_space.dart';
import '../../../widgets/vertical_space.dart';
import '../shapes/shape.dart';
import 'sized_shape_column.dart';

class ShapeColumn extends StatelessWidget {
  final Shape shape;
  final Shape? shapeClone;
  final VoidCallback onRandomisePropertiesPressed;
  final VoidCallback onClonePressed;

  const ShapeColumn({
    required this.shape,
    required this.shapeClone,
    required this.onRandomisePropertiesPressed,
    required this.onClonePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedShapeColumn(
              label: 'Original shape',
              child: shape.render(),
            ),
            HorizontalSpace(32),
            SizedShapeColumn(
              label: 'Cloned shape',
              child: shapeClone == null
                  ? const SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: Placeholder(),
                    )
                  : shapeClone!.render(),
            ),
          ],
        ),
        VerticalSpace(),
        CommonElevatedButton(
          onTap: onRandomisePropertiesPressed,
          title: 'Randomise properties',
        ),
        VerticalSpace(),
        CommonElevatedButton(
          title: 'Clone',
          onTap: onClonePressed,
        ),
      ],
    );
  }
}
