import 'memento/i_memento.dart';
import 'memento/memento.dart';
import 'shape.dart';

class Originator {
  late Shape state;

  Originator() {
    state = Shape.initial();
  }

  IMemento createMemento() {
    return Memento(state);
  }

  void restore(IMemento memento) {
    state = memento.getState();
  }
}