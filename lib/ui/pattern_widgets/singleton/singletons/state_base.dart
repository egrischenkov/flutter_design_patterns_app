import 'package:meta/meta.dart';

abstract class StateBase {
  @protected
  late String initialText;

  @protected
  late String stateText;

  String get currentText => stateText;

  void setStateText(String text) {
    stateText = text;
  }

  void reset () {
    stateText = initialText;
  }
}