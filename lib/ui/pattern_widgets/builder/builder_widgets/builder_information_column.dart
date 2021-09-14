import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';

import '../burger.dart';
import 'builder_information_label.dart';

class BurgerInformationColumn extends StatelessWidget {
  final Burger burger;

  const BurgerInformationColumn({
    required this.burger,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const BurgerInformationLabel('Price'),
        Text(burger.getFormattedPrice()),
        VerticalSpace(16),
        const BurgerInformationLabel('Ingredients'),
        Text(
          burger.getFormattedIngredients(),
          textAlign: TextAlign.justify,
        ),
         VerticalSpace(16),
        const BurgerInformationLabel('Allergens'),
        Text(
          burger.getFormattedAllergens(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
