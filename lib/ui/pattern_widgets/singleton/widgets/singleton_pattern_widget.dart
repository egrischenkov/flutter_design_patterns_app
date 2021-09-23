import 'package:flutter/material.dart';
import '../../../widgets/common_elevated_button.dart';

import '../singletons/state_base.dart';
import '../singletons/state_singleton_by_definition.dart';
import '../singletons/state_singleton_factory.dart';
import '../singletons/state_without_singleton.dart';
import 'state_card_widget.dart';

class SingletonPatternWidget extends StatefulWidget {
  @override
  _SingletonPatternWidgetState createState() => _SingletonPatternWidgetState();
}

class _SingletonPatternWidgetState extends State<SingletonPatternWidget> {
  final List<StateBase> _stateList = [
    StateSingletonFactory(),
    StateSingletonByDefinition.getInstance(),
    StateWithoutSingleton(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    print('lol');
    for (final state in _stateList) {
      state.setStateText(text);
    }
    setState((){});
  }

  void _reset() {
    for (final state in _stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final state in _stateList)
            StateCardWidget(text: state.currentText),
          const SizedBox(height:16),
          CommonElevatedButton(
            title: 'Change stateText to Singleton',
            onTap: _setTextValues,
          ),
          const SizedBox(height:16),
          CommonElevatedButton(
            title: 'Reset',
            onTap: _reset,
          ),
        ],
      ),
    );
  }
}
