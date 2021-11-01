import '../shape.dart';

import 'i_memento.dart';

class Memento extends IMemento {
  late Shape _state;

  Memento(Shape shape) {
    _state = Shape.copy(shape);
  }

  @override
  Shape getState() => _state;
}