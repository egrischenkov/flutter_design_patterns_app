import 'state_base.dart';

class StateWithoutSingleton extends StateBase {
  StateWithoutSingleton() {
    initialText = '\'A new StateWithoutSingleton\' instance has been created.';
    stateText = initialText;
  }
}