import 'dart:math';

import '../shape.dart';
import 'i_command.dart';

class ChangeWidthCommand implements ICommand {
  Shape shape;
  late final double _previousWidth;

  ChangeWidthCommand(this.shape) {
    _previousWidth = shape.width;
  }

  @override
  void execute() {
    shape.width = 50.0 + Random().nextInt(100);
  }

  @override
  String getTitle() {
    return 'Change width';
  }

  @override
  void undo() {
    shape.width = _previousWidth;
  }

}