import 'dart:math';

import 'package:flutter/material.dart';

import '../../command/commands/i_command.dart';
import '../memento/i_memento.dart';
import '../originator.dart';

class RandomisePropertiesCommand implements ICommand {
  Originator originator;
  late IMemento _backup;

  RandomisePropertiesCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  String getTitle() => "Randomise properties command";

  @override
  void execute() {
    final shape = originator.state;
    
    shape.color = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0);
    shape.height = 50.0 + Random().nextInt(100).toDouble();
    shape.width = 50.0 + Random().nextInt(100).toDouble();
  }

  @override
  void undo() {
    originator.restore(_backup);
  }
}