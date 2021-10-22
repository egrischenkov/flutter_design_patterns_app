import 'dart:math';

import 'package:flutter/material.dart';

import '../shape.dart';
import 'i_command.dart';

class ChangeColorCommand implements ICommand {
  Shape shape;
  late final Color _previousColor;

  ChangeColorCommand(this.shape) {
    _previousColor = shape.color;
  }

  @override
  void execute() {
    shape.color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1,
    );
  }

  @override
  String getTitle() {
    return 'Change color';
  }

  @override
  void undo() {
    shape.color = _previousColor;
  }
}
