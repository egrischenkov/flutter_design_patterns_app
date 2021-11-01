import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';

import '../pizza.dart';

class PizzaInformationWidget extends StatelessWidget {
  final Pizza pizza;

  const PizzaInformationWidget({required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Pizza details:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        VerticalSpace(16),
        Text(pizza.getDescription()),
        VerticalSpace(8),
        Text(
          'Price: ${pizza.getPrice().toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
