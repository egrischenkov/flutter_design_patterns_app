import 'dart:math';

import '../shape.dart';
import 'i_command.dart';

class ChangeHeightCommand implements ICommand {
  Shape shape;
  late final double _previousHeight;

  ChangeHeightCommand(this.shape) {
    _previousHeight = shape.height;
  }

  @override
  void execute() {
    shape.height = 50.0 + Random().nextInt(100).toDouble();
  }

  @override
  String getTitle() {
    return 'Change height';
  }

  @override
  void undo() {
    shape.height = _previousHeight;
  }
}