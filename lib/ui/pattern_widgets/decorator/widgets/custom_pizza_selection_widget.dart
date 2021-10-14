import 'package:flutter/material.dart';

import '../pizza_topping_data.dart';


class CustomPizzaSelectionWidget extends StatelessWidget {
  final Map<int, PizzaToppingData> pizzaToppingsDataMap;
  final Function(int, bool) onSelected;

  const CustomPizzaSelectionWidget({
    required this.pizzaToppingsDataMap,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: <Widget>[
        for (var i = 0; i < pizzaToppingsDataMap.length; i++)
          i == 0
              ? ChoiceChip(
            label: const Text(
              'Pizza Base',
              style: TextStyle(color: Colors.white),
            ),
            selected: true,
            selectedColor: Colors.black,
            onSelected: (_) {},
          )
              : ChoiceChip(
            label: Text(
              pizzaToppingsDataMap[i]!.label,
              style: TextStyle(
                color: pizzaToppingsDataMap[i]!.selected
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            selected: pizzaToppingsDataMap[i]!.selected,
            selectedColor: Colors.black,
            onSelected: (selected) => onSelected(i, selected),
          ),
      ],
    );
  }
}
