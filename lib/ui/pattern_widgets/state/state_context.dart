import 'dart:async';

import 'i_state.dart';
import 'states/loading_state.dart';
import 'states/no_results_state.dart';

class StateContext {
  final StreamController<IState> _stateStreamController = StreamController<IState>();
  Sink<IState> get _inState => _stateStreamController.sink;
  Stream<IState> get outState => _stateStreamController.stream;

  late IState _currentState;

  StateContext() {
    _currentState = NoResultsState();
    _addCurrentStateToStream();
  }

  void dispose() {
    _stateStreamController.close();
  }

  void setState(IState state) {
    _currentState = state;
    _addCurrentStateToStream();
  }

  void _addCurrentStateToStream() {
    _inState.add(_currentState);
  }

  Future<void> nextState() async {
    await _currentState.nextState(this);

    if (_currentState is LoadingState) {
      await _currentState.nextState(this);
    }
  }
}