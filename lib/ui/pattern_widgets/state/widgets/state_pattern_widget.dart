import 'package:flutter/material.dart';

import '../../../widgets/common_elevated_button.dart';
import '../../../widgets/platform_progress_indicator.dart';
import '../../../widgets/vertical_space.dart';
import '../i_state.dart';
import '../state_context.dart';
import '../states/no_results_state.dart';

class StatePatternWidget extends StatefulWidget {
  @override
  _StatePatternWidgetState createState() => _StatePatternWidgetState();
}

class _StatePatternWidgetState extends State<StatePatternWidget> {
  final StateContext _stateContext = StateContext();

  Future _changeState() {
    return _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CommonElevatedButton(
            title: 'Load names',
            onTap:  () async => await _changeState(),
          ),
          VerticalSpace(16),
          StreamBuilder<IState>(
            initialData: NoResultsState(),
            stream: _stateContext.outState,
            builder: (_, snapshot) {
              return snapshot.data?.render() ?? PlatformProgressIndicator();
            }
          ),
        ],
      ),
    );
  }
}
