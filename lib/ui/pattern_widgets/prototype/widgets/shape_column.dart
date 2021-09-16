import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
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
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(mainPageBackgroundColorLight),
          ),
          onPressed: onRandomisePropertiesPressed,
          child: Text('Randomise properties', style: TextStyle(fontSize: 20,)),
        ),
        VerticalSpace(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(mainPageBackgroundColorLight),
          ),
          onPressed: onClonePressed,
          child: Text('Clone', style: TextStyle(fontSize: 20,)),
        ),
      ],
    );
  }
}
