/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

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
