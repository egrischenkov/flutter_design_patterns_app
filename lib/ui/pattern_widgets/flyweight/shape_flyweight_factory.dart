import 'shape_factory.dart';
import 'shape_type.dart';
import 'shapes/i_positioned_shape.dart';

class ShapeFlyweightFactory {
  final ShapeFactory shapeFactory;
  final Map<ShapeType, IPositionedShape> shapesMap = {};

  ShapeFlyweightFactory({required this.shapeFactory});

  IPositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory.createShape(shapeType);
    }

    return shapesMap[shapeType] ?? shapeFactory.createShape(shapeType);
  }

  int getShapeInstancesCount() {
    return shapesMap.length;
  }
}