import '../pizza.dart';
import '../pizza_decorator.dart';

class Pepperoni extends PizzaDecorator {
  Pepperoni(Pizza pizza) : super(pizza) {
    description = 'Pepperoni';
  }

  @override
  String getDescription() => '${pizza.getDescription()}\n- $description';

  @override
  double getPrice() => pizza.getPrice() + 1.5;
}