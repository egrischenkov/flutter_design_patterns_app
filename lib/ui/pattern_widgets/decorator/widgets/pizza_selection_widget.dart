import 'package:flutter/material.dart';

class PizzaSelectionWidget extends StatelessWidget {
  final List<String> _labels = ['Pizza Margherita', 'Pizza Pepperoni', 'Custom'];
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  PizzaSelectionWidget({required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < _labels.length; index++)
          RadioListTile(
            title: Text(_labels[index]),
            value: index,
            groupValue: selectedIndex,
            selected: index == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
