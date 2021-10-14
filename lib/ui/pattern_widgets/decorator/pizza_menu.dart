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
