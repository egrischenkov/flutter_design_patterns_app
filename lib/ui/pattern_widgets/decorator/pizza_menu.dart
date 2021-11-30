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

import 'ingredients/basil.dart';
import 'ingredients/mozzarella.dart';
import 'ingredients/olive_oil.dart';
import 'ingredients/oregano.dart';
import 'ingredients/pecorino.dart';
import 'ingredients/pepperoni.dart';
import 'ingredients/sauce.dart';
import 'pizza.dart';
import 'pizza_base.dart';
import 'pizza_topping_data.dart';

class PizzaMenu {
  final Map<int, PizzaToppingData> _pizzaToppingsDataMap = {
    1: PizzaToppingData('Bazil'),
    2: PizzaToppingData('Mozzarella'),
    3: PizzaToppingData('Olive Oil'),
    4: PizzaToppingData('Oregano'),
    5: PizzaToppingData('Pecorino'),
    6: PizzaToppingData('Pepperoni'),
    7: PizzaToppingData('Sauce'),
  };

  Map<int, PizzaToppingData> getPizzaToppingDataMap() => _pizzaToppingsDataMap;

  Pizza _getMargherita() {
    Pizza pizza = PizzaBase('Pizza Margherita');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Basil(pizza);
    pizza = Oregano(pizza);
    pizza = Pecorino(pizza);
    pizza = OliveOil(pizza);

    return pizza;
  }

  Pizza _getPepperoni() {
    Pizza pizza = PizzaBase('Pepperoni');
    pizza = Sauce(pizza);
    pizza = Pepperoni(pizza);
    pizza = Mozzarella(pizza);
    pizza = Oregano(pizza);

    return pizza;
  }

  Pizza _getCustomPizza(Map<int, PizzaToppingData> pizzaToppingDataMap) {
    Pizza pizza = PizzaBase('Custom Pizza');

    if (pizzaToppingDataMap[1]!.selected) {
      pizza = Basil(pizza);
    } else if (pizzaToppingDataMap[2]!.selected) {
      pizza = Mozzarella(pizza);
    } else if (pizzaToppingDataMap[3]!.selected) {
      pizza = OliveOil(pizza);
    } else if (pizzaToppingDataMap[4]!.selected) {
      pizza = Oregano(pizza);
    } else if (pizzaToppingDataMap[5]!.selected) {
      pizza = Pecorino(pizza);
    } else if (pizzaToppingDataMap[6]!.selected) {
      pizza = Pepperoni(pizza);
    } else if (pizzaToppingDataMap[7]!.selected) {
      pizza = Sauce(pizza);
    }

    return pizza;
  }

  Pizza getPizza(int index, Map<int, PizzaToppingData> pizzaToppingDataMap) {
    switch (index) {
      case 0:
        return _getMargherita();
      case 1:
        return _getPepperoni();
      case 2:
        return _getCustomPizza(pizzaToppingDataMap);
      default:
        throw('Index of $index does not exist');
    }
  }
}
