import 'state_base.dart';

class StateSingletonFactory extends StateBase {
  static final _instance = StateSingletonFactory._();

  factory StateSingletonFactory() {
    return _instance;
  }

  StateSingletonFactory._() {
    initialText = 'A new \'StateSingletonFactory\' instance has been created.';
    stateText = initialText;
  }
}