import 'state_base.dart';

class StateSingletonByDefinition extends StateBase {
  static StateSingletonByDefinition? _instance;

  StateSingletonByDefinition._() {
    initialText = 'A new \'StateSingletonByDefinition\' instance has been created.';
    stateText = initialText;
  }

  static getInstance() {
    if (_instance == null) {
      _instance = StateSingletonByDefinition._();
      return _instance;
    } else {
      return _instance;
    }
  }
}
