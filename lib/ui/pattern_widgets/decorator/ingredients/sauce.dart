import '../pizza.dart';
import '../pizza_decorator.dart';

class Sauce extends PizzaDecorator {
  Sauce(Pizza pizza) : super(pizza) {
    description = 'Sauce';
  }

  @override
  String getDescription() => '${pizza.getDescription()}\n- $description';

  @override
  double getPrice() => pizza.getPrice() + 0.3;
}